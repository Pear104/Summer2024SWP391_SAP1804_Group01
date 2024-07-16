using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.Enums;

namespace backend.Services.DTOs.DiamondPrice
{
    public class CreateMaterialPriceDTO
    {
        public int Karat { get; set; }
        public DateTime EffTime { get; set; } = DateTime.Now;
        public double UnitPrice { get; set; }
    }
}
