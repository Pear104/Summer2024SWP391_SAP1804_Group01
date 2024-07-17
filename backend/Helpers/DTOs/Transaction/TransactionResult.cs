using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Transaction
{
    public class TransactionResult
    {
        public IEnumerable<TransactionDTO> Transactions { get; set; } = new List<TransactionDTO>();
        public int TotalPages { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalCount { get; set; }
    }
}
