using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Transaction;
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

        [HttpPost]
        public async Task<IActionResult> PostShape([FromBody] CreateTransactionDTO transactionDto)
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
        [HttpGet]
        public async Task<IActionResult> GetTransactions()
        {
            var transactions = await _transactionRepo.GetAllTransactionsAsync();
            return Ok(transactions);
        }
    }
}
