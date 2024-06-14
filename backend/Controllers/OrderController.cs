using System.Security.Claims;
using System.Transactions;
using backend.DTOs;
using backend.DTOs.Order;
using backend.Helper;
using backend.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class OrderController : ControllerBase
    {
        private readonly IOrderRepository _orderRepo;

        public OrderController(IOrderRepository orderRepo)
        {
            _orderRepo = orderRepo;
        }

        [HttpGet]
        [Authorize(Roles = ("Customer, Manager, Administrator, SaleStaff, DeliveryStaff"))]
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

        [HttpPost("pay-order/{id}")]
        public async Task<ActionResult> PayOrder([FromRoute] string id)
        {
            return Ok("http://localhost:3000/account/order-history");
        }

        [HttpPost]
        public async Task<ActionResult> CreateOrder([FromBody] CreateOrderDTO orderDto)
        {
            if (User.FindFirst("accountId")?.Value == null)
            {
                return BadRequest("The order could not be created.");
            }
            long customerId = Convert.ToInt64(User.FindFirst("accountId")?.Value);
            System.Console.WriteLine(customerId);
            var createdOrder = await _orderRepo.CreateOrderAsync(customerId, orderDto);
            if (createdOrder == null)
            {
                return BadRequest("The order could not be created.");
            }
            System.Console.WriteLine(createdOrder.OrderId);
            return Ok(createdOrder);
            // System.Console.WriteLine("diamondId: " + orderDto.OrderDetails[0].DiamondId);
            // return Ok(orderDto);
        }

        // [HttpPost]
        // public async Task<ActionResult> CreateOrder([FromBody] CreateOrderDTO order)
        // {
        //     var createdOrder = await _orderRepo.CreateOrderAsync(order);
        //     if(createdOrder == null)
        //     {
        //         return BadRequest("The order could not be created.");
        //     }
        //     return Ok(createdOrder);
        // }
        [HttpPut("{id}")]
        public async Task<ActionResult> UpdateOrder(
            [FromRoute] string id,
            [FromBody] UpdateOrderDTO order
        )
        {
            var updatedOrder = await _orderRepo.UpdateOrderAsync(id, order);
            if (updatedOrder == null)
            {
                return BadRequest("The order could not be updated.");
            }
            return Ok(updatedOrder);
        }
    }
}
