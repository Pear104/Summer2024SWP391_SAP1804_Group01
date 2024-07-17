using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Promotion
{
    public class CreatePromotionDTO
    {
        public required string PromotionName { get; set; }

        public required string PromotionCode { get; set; }

        public float DiscountPercent { get; set; }

        public DateTime StartTime { get; set; }

        public DateTime EndTime { get; set; }
    }
}
