using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.MaterialPrice
{
    public class CreateMaterialPriceDTO
    {
        public int Karat { get; set; }
        public DateTime EffTime { get; set; } = DateTime.Now;
        public double UnitPrice { get; set; }
    }
}
