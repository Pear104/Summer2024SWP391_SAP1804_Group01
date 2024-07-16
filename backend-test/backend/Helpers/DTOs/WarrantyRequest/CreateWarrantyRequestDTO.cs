using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.WarrantyRequest
{
    public class CreateWarrantyRequestDTO
    {
        public string WarrantyReason { get; set; } = string.Empty;
        public long WarrantyCardId { get; set; }
        public DateTime ReceiveTime { get; set; }
        public string ShippingAddress { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
    }
}
