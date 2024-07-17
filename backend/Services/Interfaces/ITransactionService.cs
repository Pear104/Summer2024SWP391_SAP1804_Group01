using BusinessObjects.Models;
using Helpers.DTOs.Transaction;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface ITransactionService
    {
        Task<TransactionResult?> GetAllTransactions(TransactionQuery query);
        Task<Transaction?> CreateTransaction(CreateTransactionDTO transactionDto);
        Task<Transaction?> GetTransactionById(string id);
        Task<Transaction?> CompletePayment(string id);
    }
}
