using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs.Transaction;
using backend.Enums;
using backend.Helper;
using backend.Interfaces;
using backend.Mappers;
using backend.Models;
using Microsoft.EntityFrameworkCore;

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

        public async Task<TransactionResult?> GetAllTransactionsAsync(TransactionQuery query)
        {
            var transactionsQuery = _context.Transactions.AsQueryable();

            var totalCount = await transactionsQuery.CountAsync();
            var totalPages = totalCount / (query.PageSize ?? 10);
            var Transactions = await transactionsQuery
                .Skip(((query.PageNumber ?? 1) - 1) * (query.PageSize ?? 10))
                .Take(query.PageSize ?? 10)
                .Select(x => x.ToTransactionDTO())
                .ToListAsync();

            return new TransactionResult
            {
                Transactions = Transactions,
                TotalPages = totalPages,
                TotalCount = totalCount,
                PageSize = query.PageSize ?? 10,
                CurrentPage = query.PageNumber ?? 1
            };
        }
    }
}
