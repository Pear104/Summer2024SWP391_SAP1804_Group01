using BusinessObjects.Enums;
using BusinessObjects.Models;
using DAOs;
using Helpers.DTOs.Transaction;
using Helpers.Mappers;
using Helpers.Queries;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class TransactionRepository : ITransactionRepository
    {
        private readonly ApplicationDbContext _context;

        public TransactionRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Transaction?> CompletePaymentAsync(string id)
        {
            var transaction = await _context.Transactions.FirstOrDefaultAsync(o =>
                o.TransactionId.Equals(id)
            );
            transaction!.TransactionStatus = TransactionStatus.Completed;
            _context.Entry(transaction).State = EntityState.Modified;
            _context.SaveChanges();
            return transaction;
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

            if (!query.SearchOrderId.IsNullOrEmpty())
            {
                transactionsQuery = transactionsQuery.Where(tq =>
                    tq.OrderId!.Contains(query.SearchOrderId!)
                );
            }

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

        public async Task<Transaction?> GetTransactionByIdAsync(string id)
        {
            return await _context.Transactions.FirstOrDefaultAsync(x => x.TransactionId.Equals(id));
        }
    }
}
