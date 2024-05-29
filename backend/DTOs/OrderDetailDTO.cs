using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs
{
    public class OrderDetailDTO
    {
        public long OrderDetailId { get; set; }
        public float? Size { get; set; }
        public double ItemPrice { get; set; }
        public long OrderId { get; set; }
        public long DiamondId { get; set; }
        public long AccessoryId { get; set; }
        public long WarrantyCardId { get; set; }
    }
}