using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.Enums;

namespace backend.Services.DTOs.Transaction
{
    public class UpdateTransactionDTO
    {
        public TransactionStatus TransactionStatus { get; set; }
    }
}
