using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.WarrantyRequest
{
    public class UpdateWarrantyRequestDTO
    {
        public long? WarrantyRequestId { get; set; }
        public string? WarrantyReason { get; set; } = string.Empty;
        public long? CustomerId { get; set; }
        public long? WarrantyStaffId { get; set; }
        public long? DeliveryStaffId { get; set; }
        public long? WarrantyCardId { get; set; }
        public DateTime? ReceiveTime { get; set; }
        public DateTime? ReturnTime { get; set; }
        public string? WarrantyStatus { get; set; }
        public string? ShippingAddress { get; set; } = string.Empty;
        public string? PhoneNumber { get; set; } = string.Empty;
    }
}
