using backend.DTOs;
using backend.DTOs.Order;
using backend.Helper;
using backend.Interfaces;
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
        public async Task<ActionResult> GetOrders([FromQuery] OrderQuery query)
        {
            var orderResult = await _orderRepo.GetAllOrdersAsync(query);
            return Ok(orderResult);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetOrder(long id)
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
            long customerId = long.Parse(User.FindFirst("accountId")?.Value);
            System.Console.WriteLine(customerId);
            // System.Console.WriteLine(typeof(customerId));
            if (customerId == null)
            {
                return BadRequest("The order could not be created.");
            }
            var createdOrder = await _orderRepo.CreateOrderAsync(customerId, orderDto);
            if (createdOrder == null)
            {
                return BadRequest("The order could not be created.");
            }
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
            [FromRoute] long id,
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
