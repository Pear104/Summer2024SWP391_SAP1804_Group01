using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.BusinessOjects.Models;
using backend.Services.DTOs.Account;
using backend.Services.DTOs.PriceRate;

namespace backend.Services.DTOs.Order
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
