using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.DiamondPrice
{
    public class DiamondPriceDTO
    {
        public long DiamondPriceId { get; set; }
        public DateTime EffTime { get; set; }
        public float MinCaratEff { get; set; }
        public float MaxCaratEff { get; set; }
        public string Color { get; set; } = string.Empty;
        public string Clarity { get; set; } = string.Empty;
        public double UnitPrice { get; set; }
    }
}
