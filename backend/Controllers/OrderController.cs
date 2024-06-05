using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs;
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
        public async Task<ActionResult> GetOrders()
        {
            var orderDTOs = await _orderRepo.GetAllOrdersAsync();
            return Ok(orderDTOs);
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
        public async Task<ActionResult> CreateOrder([FromBody] OrderDTO order)
        {
            var createdOrder = await _orderRepo.CreateOrderAsync(order);
            if(createdOrder == null)
            {
                return BadRequest("The order could not be created.");
            }
            return Ok(createdOrder);
        }
        // [HttpPut("{id}")]
        // public async Task<ActionResult> UpdateOrder(long id, [FromBody] UpdateOrderDTO order)
        // {
        //     var updatedOrder = await _orderRepo.UpdateOrderAsync(order);
        //     if(updatedOrder == null)
        //     {
        //         return BadRequest("The order could not be updated.");
        //     }
        //     return Ok(updatedOrder);
        // }
        
    }
}
