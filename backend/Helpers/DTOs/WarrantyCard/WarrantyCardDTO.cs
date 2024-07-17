using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Helpers.DTOs.Accessory;
using Helpers.DTOs.Diamond;

namespace Helpers.DTOs.WarrantyCard
{
    public class WarrantyCardDTO
    {
        public long WarrantyCardId { get; set; }
        public long? DiamondId { get; set; }
        public long? AccessoryId { get; set; }
        public string? CustomerName { get; set; }
        public string? AccessoryName { get; set; }
        public string? DiamondName { get; set; }
        public AccessoryDTO? Accessory { get; set; }
        public DiamondDTO? Diamond { get; set; }
        public DateTime StartTime { get; set; } = DateTime.Now;
        public DateTime EndTime { get; set; } = DateTime.Now.AddMonths(12);
    }
}
