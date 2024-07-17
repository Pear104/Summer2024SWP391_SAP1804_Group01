using System.Globalization;
using System.Security.Claims;
using backend.Payment_src.core.Payment.Service.Paypal.Model;
using BusinessObjects.Enums;
using Helpers.DTOs.Order;
using Helpers.Queries;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class OrderController : ControllerBase
    {
        private readonly IOrderService _orderService;
        private readonly IEmailSender _emailSender;
        private readonly PaypalClient _paypalClient;
        private readonly ITransactionService _transactionService;

        public OrderController(
            IOrderService orderService,
            IEmailSender emailSender,
            PaypalClient paypalClient,
            ITransactionService transactionService
        )
        {
            _orderService = orderService;
            _emailSender = emailSender;
            _paypalClient = paypalClient;
            _transactionService = transactionService;
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
            var orderResult = await _orderService.GetAllOrders(query);
            return Ok(orderResult);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetOrder([FromRoute] string id)
        {
            var order = await _orderService.GetOrderById(id);
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
            var createdOrder = await _orderService.CreateOrder(customerId, orderDto);
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
            var currentOrder = await _orderService.GetOrderById(id);
            if (currentOrder == null)
            {
                return BadRequest("The order could not be updated.");
            }
            var status = currentOrder.OrderStatus;
            var updatedOrder = await _orderService.UpdateOrder(id, order);
            if (updatedOrder == null)
            {
                return BadRequest("The order could not be updated.");
            }
            if (status != updatedOrder.OrderStatus)
            {
                Console.WriteLine("Send email");
                _emailSender.SendOrderEmail(currentOrder, updatedOrder.OrderStatus.ToString());
            }
            return Ok(updatedOrder);
        }

        #region Paypal
        [HttpPost("createPaypalOrder")]
        public async Task<ActionResult> CreateOrderPaypal(
            CancellationToken cancellationToken,
            [FromBody] CreatePaypalOrderRequest createPaypalOrderRequest
        )
        {
            Console.WriteLine("\n\n\n");
            Console.WriteLine("Order: " + createPaypalOrderRequest.OrderId);
            Console.WriteLine("Transaction: " + createPaypalOrderRequest.Reference);
            Console.WriteLine("\n\n\n");
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

            Console.WriteLine("\n\n\n");
            var order = await _orderService.GetOrderById(createPaypalOrderRequest.OrderId);
            Console.WriteLine("\n\n\n");

            Console.WriteLine("order: " + order?.OrderId);

            Console.WriteLine("\n\n\n");

            var transaction = await _transactionService.GetTransactionById(
                createPaypalOrderRequest.Reference
            );
            Console.WriteLine("transaction: " + transaction);
            Console.WriteLine("order: " + order);
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
                var response = await _paypalClient.CreateOrder(
                    amount,
                    currency,
                    createPaypalOrderRequest.Reference
                );
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
            public string Reference { get; set; } = string.Empty;
            public string OrderId { get; set; } = string.Empty;
        }

        public class Reference
        {
            public string OrderId { get; set; } = string.Empty;
        }

        [HttpPost("capturePaypalOrder")]
        public async Task<ActionResult> CapturePaypalOrder(
            CancellationToken cancellationToken,
            [FromBody] Reference Reference
        )
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

        [HttpPut("completePayment/{orderId}")]
        public async Task<ActionResult> CompletePayment(
            CancellationToken cancellationToken,
            [FromRoute] string orderId
        )
        {
            try
            {
                var response = await _orderService.CompleteOrder(orderId);
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
