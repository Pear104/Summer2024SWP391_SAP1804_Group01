using BusinessObjects.Models.Payment.Domain.Entities;

namespace Repositories.Interfaces.Payments
{
    public interface IPaymentTransactionRepository
    {
        public Task<PaymentTransaction>? CreateTransaction(PaymentTransaction transaction);
        public Task<PaymentTransaction>? GetTransactionById(string id);
        public Task<List<PaymentTransaction>> GetAllTransactions();
        public Task<List<PaymentTransaction>> GetAllTransactionsByPaymentId(string id);
    }
}
