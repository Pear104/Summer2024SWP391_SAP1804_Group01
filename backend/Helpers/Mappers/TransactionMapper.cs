
using BusinessObjects.Models;
using Helpers.DTOs.Transaction;

namespace Helpers.Mappers
{
    public static class TransactionMapper
    {
        public static TransactionDTO ToTransactionDTO(this Transaction Transaction)
        {
            return new TransactionDTO
            {
                TransactionId = Transaction.TransactionId,
                CreatedAt = Transaction.CreatedAt,
                Amount = Transaction.Amount,
                OrderId = Transaction.OrderId,
                PaymentMethod = Transaction.PaymentMethod,
                TransactionStatus = Transaction.TransactionStatus.ToString(),
            };
        }

        public static Transaction ToTransactionFromCreate(this CreateTransactionDTO transactionDto)
        {
            return new Transaction
            {
                OrderId = transactionDto.OrderId,
                Amount = transactionDto.Amount,
                PaymentMethod = transactionDto.PaymentMethod
            };
        }
    }
}
