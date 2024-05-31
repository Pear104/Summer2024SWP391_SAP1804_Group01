// using System;
// using System.Collections.Generic;
// using System.Diagnostics;
// using System.Linq;
// using System.Threading.Tasks;
// using Microsoft.AspNetCore.Mvc;
// using Microsoft.Extensions.Logging;

// namespace backend.Controllers
// {
//     [Route("[controller]")]
//     public class OrderController : Controller
//     {
//         private readonly ILogger<OrderController> _logger;

//         public OrderController(ILogger<OrderController> logger)
//         {
//             _logger = logger;
//         }

//         public IActionResult Index()
//         {
//             return View();
//         }

//         [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
//         public IActionResult Error()
//         {
//             return View("Error!");
//         }
//     }
// }