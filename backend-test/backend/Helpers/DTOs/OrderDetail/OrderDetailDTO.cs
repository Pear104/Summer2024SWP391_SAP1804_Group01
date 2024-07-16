using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using Helpers.DTOs.Accessory;
using Helpers.DTOs.Diamond;
using Helpers.DTOs.DiamondPrice;
using Helpers.DTOs.Feedback;
using Helpers.DTOs.MaterialPrice;
using Helpers.DTOs.WarrantyCard;

namespace Helpers.DTOs.OrderDetail
{
    public class OrderDetailDTO
    {
        public long OrderDetailId { get; set; }
        public float? Size { get; set; }
        public string? OrderId { get; set; }
        public DiamondDTO? Diamond { get; set; }
        public AccessoryDTO? Accessory { get; set; }
        public double? ItemPrice { get; set; }
        public List<WarrantyCardDTO>? WarrantyCards { get; set; }
        public DiamondPriceDTO? DiamondPrice { get; set; }
        public MaterialPriceDTO? MaterialPrice { get; set; }
        public FeedbackDTO? Feedback { get; set; }
    }
}
