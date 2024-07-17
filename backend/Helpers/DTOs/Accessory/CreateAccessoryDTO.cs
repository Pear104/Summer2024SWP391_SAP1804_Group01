using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Accessory
{
    public class CreateAccessoryDTO
    {
        [Required]
        public int Karat { get; set; }

        [Required]
        public float MaterialWeight { get; set; }

        [Required]
        public string Name { get; set; } = string.Empty;

        [Required]
        public int Quantity { get; set; }

        [Required]
        public string AccessoryType { get; set; } = string.Empty;

        [Required]
        public string Shape { get; set; } = string.Empty;

        [Required]
        public List<string> AccessoryImages { get; set; } = new List<string>();
    }
}
