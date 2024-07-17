using Helpers.DTOs.Transaction;
using Helpers.Queries;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TransactionsController : ControllerBase
    {
        private readonly ITransactionService _transactionService;

        public TransactionsController(ITransactionService transactionService)
        {
            _transactionService = transactionService;
        }

        [HttpGet]
        public async Task<IActionResult> GetTransactions([FromQuery] TransactionQuery query)
        {
            var transactionResult = await _transactionService.GetAllTransactions(query);
            return Ok(transactionResult);
        }

        [HttpPost]
        public async Task<IActionResult> PostTransaction(
            [FromBody] CreateTransactionDTO transactionDto
        )
        {
            var newTransaction = await _transactionService.CreateTransaction(transactionDto);
            if (newTransaction == null)
            {
                return BadRequest(
                    "The order your are paying for not exists or already be cancelled."
                );
            }
            return Ok(newTransaction);
        }

        [HttpPut("completePayment/{id}")]
        public async Task<IActionResult> CompletePayment([FromRoute] string id)
        {
            var transaction = await _transactionService.CompletePayment(id);
            if (transaction == null)
            {
                return NotFound("Transaction not found.");
            }
            return Ok(transaction);
        }
    }
}
