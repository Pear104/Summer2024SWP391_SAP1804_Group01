using BusinessObjects.Models;
using Helpers.DTOs.Transaction;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class TransactionService : ITransactionService
    {
        private readonly ITransactionRepository _transactionRepository;

        public TransactionService(ITransactionRepository transactionRepository)
        {
            this._transactionRepository = transactionRepository;
        }

        public Task<Transaction?> CompletePayment(string id)
        {
            return _transactionRepository.CompletePaymentAsync(id);
        }

        public Task<Transaction?> CreateTransaction(CreateTransactionDTO transactionDto)
        {
            return _transactionRepository.CreateTransactionAsync(transactionDto);
        }

        public Task<TransactionResult?> GetAllTransactions(TransactionQuery query)
        {
            return _transactionRepository.GetAllTransactionsAsync(query);
        }

        public Task<Transaction?> GetTransactionById(string id)
        {
            return _transactionRepository.GetTransactionByIdAsync(id);
        }
    }
}
