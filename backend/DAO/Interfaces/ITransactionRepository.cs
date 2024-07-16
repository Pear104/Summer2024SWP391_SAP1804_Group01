using backend.BusinessOjects.Models;
using backend.Services.DTOs.Transaction;
using backend.Services.QueriesHelper;

namespace backend.Interfaces
{
    public interface ITransactionRepository
    {
        Task<TransactionResult?> GetAllTransactionsAsync(TransactionQuery query);
        Task<Transaction?> CreateTransactionAsync(CreateTransactionDTO transactionDto);
        Task<Transaction?> GetTransactionByIdAsync(string id);
        Task<Transaction?> CompletePaymentAsync(string id);
    }
}
