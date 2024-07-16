using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.DTOs.Transaction;
using backend.BusinessOjects.Models;

namespace backend.Services.Mappers
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
