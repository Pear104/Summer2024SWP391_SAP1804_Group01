using BusinessObjects.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.DiamondPrice
{
    public class CreateDiamondPriceDTO
    {
        [Required]
        public float MinCaratEff { get; set; }

        [Required]
        public float MaxCaratEff { get; set; }

        [Required]
        [EnumDataType(typeof(Color))]
        public Color Color { get; set; } = Color.V;

        [Required]
        [EnumDataType(typeof(Clarity))]
        public Clarity Clarity { get; set; } = Clarity.I3;

        [Required]
        [Range(0.01, double.MaxValue)]
        public double UnitPrice { get; set; }
    }
}
