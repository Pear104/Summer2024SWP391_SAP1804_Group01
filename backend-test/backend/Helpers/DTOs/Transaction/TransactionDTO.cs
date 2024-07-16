using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Transaction
{
    public class TransactionDTO
    {
        public string? TransactionId { get; set; }
        public string? OrderId { get; set; }
        public string PaymentMethod { get; set; } = string.Empty;
        public double Amount { get; set; }
        public string? TransactionStatus { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}
