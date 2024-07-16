using BusinessObjects.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Transaction
{
    public class UpdateTransactionDTO
    {
        public TransactionStatus TransactionStatus { get; set; }
    }
}
