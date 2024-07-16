using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using backend.Enums;

namespace backend.DTOs.DiamondPrice
{
    public class MaterialPriceDTO
    {
        public long MaterialPriceId { get; set; }
        public int Karat { get; set; }
        public DateTime EffTime { get; set; } = DateTime.Now;
        public double UnitPrice { get; set; }
    }
}
