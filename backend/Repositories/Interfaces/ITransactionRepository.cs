
using BusinessObjects.Models;
using Helpers.DTOs.Transaction;
using Helpers.Queries;

namespace Repositories.Interfaces
{
    public interface ITransactionRepository
    {
        Task<TransactionResult?> GetAllTransactionsAsync(TransactionQuery query);
        Task<Transaction?> CreateTransactionAsync(CreateTransactionDTO transactionDto);
        Task<Transaction?> GetTransactionByIdAsync(string id);
        Task<Transaction?> CompletePaymentAsync(string id);
    }
}
