using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportController : ControllerBase
    {
        private readonly IReportService _reportService;

        public ReportController(IReportService reportService)
        {
            _reportService = reportService;
        }

        [HttpGet("TransactionReport")]
        public async Task<ActionResult> GetTransactionReport()
        {
            var transactions = await _reportService.GetAllTransactions();
            return Ok(transactions);
        }

        [HttpGet("AccessoryReport")]
        public async Task<ActionResult> GetAccessoryReport()
        {
            var accessories = await _reportService.GetAccessoryReport();
            return Ok(accessories);
        }

        [HttpGet("SalesReport")]
        public async Task<ActionResult> GetSalesReport()
        {
            var sales = await _reportService.GetSalesReport();
            return Ok(sales);
        }

        [HttpGet("BasicReport")]
        public async Task<ActionResult> GetReport()
        {
            var report = await _reportService.GetReport();
            return Ok(report);
        }

        [HttpGet("DeliveryReport")]
        public async Task<ActionResult> GetDeliveryReport()
        {
            var delivery = await _reportService.GetDeliveryReport();
            return Ok(delivery);
        }

        [HttpGet("PotentialCustomerReport")]
        public async Task<ActionResult> GetPotentialCustomerReport()
        {
            var customers = await _reportService.GetCustomerReport();
            return Ok(customers);
        }
    }
}
