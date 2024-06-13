using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Enums;

namespace backend.Helper
{
    public class WarrantyRequestQuery
    {
        public DateTime? ReceiveTime { get; set; }
        public DateTime? ReturnTime { get; set; }
        public WarrantyStatus? WarrantyStatus { get; set; }
        public int PageSize { get; set; } = 20;
        public int PageNumber { get; set; } = 1;
    }
}