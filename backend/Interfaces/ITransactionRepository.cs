using backend.DTOs.Transaction;
using backend.Helper;
using backend.Models;

namespace backend.Interfaces
{
    public interface ITransactionRepository
    {
        Task<TransactionResult?> GetAllTransactionsAsync(TransactionQuery query);
        Task<Transaction?> CreateTransactionAsync(CreateTransactionDTO transactionDto);
    }
}
