using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Accessory
{
    public class UpdateAccessoryDTO
    {
        public int Karat { get; set; }

        public float MaterialWeight { get; set; }
        public int Quantity { get; set; }

        public string Name { get; set; } = string.Empty;

        public string AccessoryType { get; set; } = string.Empty;

        public string Shape { get; set; } = string.Empty;
        public List<string> AccessoryImages { get; set; } = new List<string>();
    }
}
