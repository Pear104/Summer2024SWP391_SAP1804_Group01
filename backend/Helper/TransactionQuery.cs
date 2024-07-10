using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Helper
{
    public class TransactionQuery
    {
        public string? SearchOrderId { get; set; } = string.Empty;
        public int? PageSize { get; set; }
        public int? PageNumber { get; set; }
    }
}
