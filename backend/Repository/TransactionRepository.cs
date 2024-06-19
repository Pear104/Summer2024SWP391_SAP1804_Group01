using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs.Transaction;
using backend.Interfaces;
using backend.Models;
using Microsoft.EntityFrameworkCore;
using backend.Enums;
namespace backend.Repository
{
    public class TransactionRepository : ITransactionRepository
    {
        private readonly ApplicationDbContext _context;

        public TransactionRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Transaction?> CreateTransactionAsync(CreateTransactionDTO transactionDto)
        {
            var order = await _context.Orders.FirstOrDefaultAsync(x =>
                x.OrderId == transactionDto.OrderId
            );
            if (order == null)
            {
                return null;
            }

            var newTransaction = new Transaction()
            {
                TransactionId = $"ORD{order.OrderId}-TRS{DateTime.Now.Ticks.ToString()}",
                Order = order,
                PaymentMethod = transactionDto.PaymentMethod,
                Amount = transactionDto.Amount,
            };
            await _context.Transactions.AddAsync(newTransaction);
            await _context.SaveChangesAsync();
            return newTransaction;
        }

        public Task<Transaction?> DeleteTransactionAsync(long id)
        {
            throw new NotImplementedException();
        }

       

        public Task<Transaction?> GetTransactionByIdAsync(long id)
        {
            throw new NotImplementedException();
        }

        public Task<Transaction?> UpdateTransactionAsync(
            long id,
            UpdateTransactionDTO transactionDto
        )
        {
            throw new NotImplementedException();
        }
    }
}
