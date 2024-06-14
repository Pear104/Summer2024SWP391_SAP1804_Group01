using backend.DTOs.Transaction;
using backend.Models;

namespace backend.Interfaces
{
    public interface ITransactionRepository
    {
        Task<IEnumerable<Transaction>> GetAllTransactionsAsync();
        Task<Transaction?> GetTransactionByIdAsync(long id);
        Task<Transaction?> CreateTransactionAsync(CreateTransactionDTO transactionDto);
        Task<Transaction?> UpdateTransactionAsync(long id, UpdateTransactionDTO transactionDto);
        Task<Transaction?> DeleteTransactionAsync(long id);
    }
}
