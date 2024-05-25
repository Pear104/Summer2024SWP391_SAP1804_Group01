using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly OrderRepository _orderrepo;

        public OrderController(OrderRepository orderrepo)
        {
            _orderrepo = orderrepo;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            return Ok("Error!");
        }

        [HttpPost]
        public async Task<IActionResult> Create()
        {
            return Ok("Error!");
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetByID()
        {
            return Ok("Error!");
        }


        [HttpPut("{id}")]
        public async Task<IActionResult> Update()
        {
            return Ok("Error!");
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete()
        {
            return Ok("Error!");
        }
    }
}