using System;
using System.Globalization;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Transactions;
using backend.DTOs;
using backend.DTOs.Order;
using backend.Enums;
using backend.Helper;
using backend.Interfaces;
using backend.Payment_src.core.Payment.Service.Paypal.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class OrderController : ControllerBase
    {
        private readonly IOrderRepository _orderRepo;
        private readonly IEmailSender _emailSender;
        private readonly PaypalClient _paypalClient;
        private readonly ITransactionRepository _transactionRepo;

        public OrderController(IOrderRepository orderRepo, IEmailSender emailSender, PaypalClient paypalClient)
        {
            _orderRepo = orderRepo;
            _emailSender = emailSender;
            _paypalClient = paypalClient;
        }

        [HttpGet]
        [Authorize(Roles = "Customer, Manager, Administrator, SaleStaff, DeliveryStaff")]
        public async Task<ActionResult> GetOrders([FromQuery] OrderQuery query)
        {
            var accountId = User.FindFirst("accountId")?.Value;
            var role = User.FindFirst(ClaimTypes.Role)?.Value;
            if (role == "Customer")
            {
                query.CustomerId = long.Parse(accountId ?? "0");
            }
            if (role == "SaleStaff")
            {
                query.SaleStaffId = long.Parse(accountId ?? "0");
            }
            if (role == "DeliveryStaff")
            {
                query.DeliveryStaffId = long.Parse(accountId ?? "0");
            }
            var orderResult = await _orderRepo.GetAllOrdersAsync(query);
            return Ok(orderResult);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetOrder([FromRoute] string id)
        {
            var order = await _orderRepo.GetOrderByIdAsync(id);
            if (order == null)
            {
                return NotFound();
            }
            return Ok(order);
        }

        [HttpPost]
        public async Task<ActionResult> CreateOrder([FromBody] CreateOrderDTO orderDto)
        {
            if (User.FindFirst("accountId")?.Value == null)
            {
                return BadRequest("The order could not be created.");
            }
            long customerId = Convert.ToInt64(User.FindFirst("accountId")?.Value);
            var createdOrder = await _orderRepo.CreateOrderAsync(customerId, orderDto);
            if (createdOrder == null)
            {
                return BadRequest("The order could not be created.");
            }
            _emailSender.SendOrderEmail(createdOrder, OrderStatus.Processing.ToString());
            return Ok(createdOrder);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> UpdateOrder(
            [FromRoute] string id,
            [FromBody] UpdateOrderDTO order
        )
        {
            var currentOrder = await _orderRepo.GetOrderByIdAsync(id);
            if (currentOrder == null)
            {
                return BadRequest("The order could not be updated.");
            }
            var status = currentOrder.OrderStatus;
            var updatedOrder = await _orderRepo.UpdateOrderAsync(id, order);
            if (updatedOrder == null)
            {
                return BadRequest("The order could not be updated.");
            }
            if (status != updatedOrder.OrderStatus)
            {
                System.Console.WriteLine("Send email");
                _emailSender.SendOrderEmail(currentOrder, updatedOrder.OrderStatus.ToString());
            }
            return Ok(updatedOrder);
        }

        #region Paypal        
        [HttpPost("createPaypalOrder")]
        public async Task<ActionResult> CreateOrderPaypal(CancellationToken cancellationToken, [FromBody] CreatePaypalOrderRequest createPaypalOrderRequest)
        {
            //Thong tin cua don hang gui qua paypal
            if (createPaypalOrderRequest == null)
            {
                return BadRequest(new { Message = "Invalid request" });
            }
            if (string.IsNullOrEmpty(createPaypalOrderRequest.OrderId))
            {
                return BadRequest(new { Message = "OrderId is required" });
            }
             if (string.IsNullOrEmpty(createPaypalOrderRequest.Reference))
            {
                return BadRequest(new { Message = "TransactionId is required" });
            }
            var order = await _orderRepo.GetOrderByIdAsync(createPaypalOrderRequest.OrderId);
            var transaction = await _transactionRepo.GetTransactionByIdAsync(createPaypalOrderRequest.Reference);
            if (order == null)
            {
                return NotFound(new { Message = "Order not found" });
            }
            if (transaction == null)
            {
                return NotFound(new { Message = "Transaction not found" });
            }
            var amount = transaction.Amount.ToString("F2", CultureInfo.InvariantCulture);
            Console.WriteLine("This amount: " + amount);
            var currency = "USD";
            try
            {
                var response = await _paypalClient.CreateOrder(amount, currency, createPaypalOrderRequest.Reference);
                return Ok(response);
            }
            catch (Exception e)
            {
                var error = new { e.GetBaseException().Message };
                return BadRequest(error);
            }
        }
        public class CreatePaypalOrderRequest
        {
            public string Reference { get; set; }
            public string OrderId { get; set; }
        }
        public class Reference
        {
            public string OrderId { get; set; }
        }

        [HttpPost("capturePaypalOrder")]
        public async Task<ActionResult> CapturePaypalOrder(CancellationToken cancellationToken, [FromBody] Reference Reference)
        {
            try
            {
                var response = await _paypalClient.CaptureOrder(Reference.OrderId);
                return Ok(response);
            }
            catch (Exception e)
            {
                var error = new { e.GetBaseException().Message };
                return BadRequest(error);
            }
        }

        [HttpPut("completePayment")]
        public async Task<ActionResult> CompletePayment(CancellationToken cancellationToken, [FromBody] string orderId)
        {
            try
            {
                var response = await _orderRepo.CompleteOrderAsync(orderId);
                return Ok(response);
            }
            catch (Exception e)
            {
                var error = new { e.GetBaseException().Message };
                return BadRequest(error);
            }
        }
        #endregion
    }
}
