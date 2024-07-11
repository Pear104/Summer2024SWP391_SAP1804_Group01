using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Helper
{
    public class PriceRateQuery
    {
        public long? PriceRateId { get; set; }
        public long? AccountId { get; set; }
        public float? Percent { get; set; }
        public DateTime? createdAt { get; set; }
        public DateTime? SearchCreatedAt { get; set; }

        public int PageSize { get; set; } = 10;
        public int PageNumber { get; set; } = 1;

    }
}