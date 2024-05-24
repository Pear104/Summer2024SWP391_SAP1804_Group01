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
        public async Task<IActionResult> GetAll()
        {
            return Ok();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public async Task<IActionResult> GetByID()
        {
            return Ok("Error!");
        }
        public async Task<IActionResult> Create()
        {
            return Ok("Error!");
        }
        public async Task<IActionResult> Update()
        {
            return Ok("Error!");
        }
        public async Task<IActionResult> dd()
        {
            return Ok("Error!");
        }
    }
}