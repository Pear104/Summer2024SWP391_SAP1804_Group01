using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.Enums;

namespace Helpers.DTOs.Transaction
{
    public class UpdateTransactionDTO
    {
        public TransactionStatus TransactionStatus { get; set; }
    }
}
