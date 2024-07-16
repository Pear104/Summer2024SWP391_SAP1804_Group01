using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs.Transaction
{
    public class CreateTransactionDTO
    {
        public string? OrderId { get; set; }
        public string PaymentMethod { get; set; } = string.Empty;
        public double Amount { get; set; }
    }
}
