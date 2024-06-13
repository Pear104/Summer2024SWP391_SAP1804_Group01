using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs.WarrantyCard
{
    public class WarrantyCardDTO
    {
        public long WarrantyCardId { get; set; }
        public long OrderDetailId { get; set; }
        public DateTime StartTime { get; set; } = DateTime.Now;
        public DateTime EndTime { get; set; } = DateTime.Now.AddMonths(12);
    }
}