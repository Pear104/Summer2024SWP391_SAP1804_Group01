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
        public async Task<ActionResult> GetTransactionReport()
        {
            var transactions = await _reportService.GetAllTransactionsAsync();
            return Ok(transactions);
        }
        [HttpGet("AccessoryReport")]
        public async Task<ActionResult> GetAccessoryReport()
        {
            var accessories = await _reportService.GetAccessoryReport();
            return Ok(accessories);
        }
    }
}