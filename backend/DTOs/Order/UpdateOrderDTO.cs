using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs
{
    public class UpdateOrderDTO
    {
        public string ContactStatus { get; set; } = string.Empty;
        public string ConfirmStatus { get; set; } = string.Empty;
        public string DeliveryStatus { get; set; } = string.Empty;
        public string OrderStatus { get; set; } = string.Empty;
    }
}