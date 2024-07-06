using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Transaction;
using backend.Helper;
using backend.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TransactionsController : ControllerBase
    {
        private readonly ITransactionRepository _transactionRepo;

        public TransactionsController(ITransactionRepository transactionRepo)
        {
            _transactionRepo = transactionRepo;
        }
        [HttpGet]
        public async Task<IActionResult> GetTransactions([FromQuery] TransactionQuery query)
        {
            var transactionResult = await _transactionRepo.GetAllTransactionsAsync(query);
            return Ok(transactionResult);
        }

        [HttpPost]
        public async Task<IActionResult> PostTransaction(
            [FromBody] CreateTransactionDTO transactionDto
        )
        {
            var newTransaction = await _transactionRepo.CreateTransactionAsync(transactionDto);
            if (newTransaction == null)
            {
                return BadRequest(
                    "The order your are paying for not exists or already be cancelled."
                );
            }
            return Ok(newTransaction);
        }

        [HttpPut("completePayment")]
        public async Task<IActionResult> CompletePayment(
            [FromBody] string id
        )
        {
            var transaction = await _transactionRepo.CompletePaymentAsync(id);
            if (transaction == null)
            {
                return NotFound("Transaction not found.");
            }
            return Ok(transaction);
        }


    }
}
