using backend.Helper;
using backend.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportController : ControllerBase
    {
        private readonly IReportRepository _reportService;
        public ReportController(IReportRepository reportService)
        {
            _reportService = reportService;
        }
        [HttpGet("TransactionReport")]
        public async Task<ActionResult> GetTransactionReport([FromBody] TransactionReportQuery query)
        {
            var transactions = await _reportService.GetAllTransactionsAsync(query);
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