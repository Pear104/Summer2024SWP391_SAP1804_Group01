using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Enums;

namespace backend.Helper
{
    public class WarrantyRequestQuery
    {
        public long? CustomerId { get; set; }
        public long? SaleStaffId { get; set; }
        public long? DeliveryStaffId { get; set; }
        public DateTime? ReceiveTime { get; set; }
        public DateTime? ReturnTime { get; set; }
        public WarrantyStatus? WarrantyStatus { get; set; } = null;
        public int PageSize { get; set; } = 10;
        public int PageNumber { get; set; } = 1;
    }
}