using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Order
{
    public class OrderStaffDTO
    {
        public string? OrderId { get; set; }
        public string OrderStatus { get; set; } = string.Empty;
        public long? SaleStaffId { get; set; }
        public string? SaleStaffName { get; set; } = string.Empty;
        public long? DeliveryStaffId { get; set; }
        public string? DeliveryStaffName { get; set; } = string.Empty;
    }
}
