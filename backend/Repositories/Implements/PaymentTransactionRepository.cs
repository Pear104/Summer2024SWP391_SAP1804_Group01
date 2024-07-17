using BusinessObjects.Models.Payment.Domain.Entities;
using DAOs;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces.Payments;

namespace Repositories.Implements
{
    public class PaymentTransactionRepository : IPaymentTransactionRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public PaymentTransactionRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<PaymentTransaction> CreateTransaction(PaymentTransaction transaction)
        {
            await _dbContext.PaymentTransactions.AddAsync(transaction);
            await _dbContext.SaveChangesAsync();
            return transaction;
        }

        public async Task<List<PaymentTransaction>> GetAllTransactions()
        {
            return await _dbContext.PaymentTransactions.ToListAsync();
        }

        public async Task<List<PaymentTransaction>> GetAllTransactionsByPaymentId(string paymentId)
        {
            var transactions = await _dbContext
                .PaymentTransactions.Where(transaction =>
                    transaction.PaymentId.ToLower().Equals(paymentId.ToLower())
                )
                .ToListAsync();
            return transactions;
        }

        public async Task<PaymentTransaction> GetTransactionById(string id)
        {
            var transaction = await _dbContext.PaymentTransactions.FirstOrDefaultAsync(t =>
                t.Id.ToLower().Equals(id.ToLower())
            );
            return transaction;
        }
    }
}
