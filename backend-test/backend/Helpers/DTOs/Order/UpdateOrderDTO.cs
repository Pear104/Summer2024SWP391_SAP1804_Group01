using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.DTOs.Account;

namespace Helpers.DTOs.Order
{
    public class UpdateOrderDTO
    {
        public string? OrderStatus { get; set; }
        public long? SaleStaffId { get; set; } = 0;
        public long? DeliveryStaffId { get; set; } = 0;
    }
}
