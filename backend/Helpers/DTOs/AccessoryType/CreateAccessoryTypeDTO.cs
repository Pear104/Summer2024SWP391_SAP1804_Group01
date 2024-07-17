using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.AccessoryType
{
    public class CreateAccessoryTypeDTO
    {
        [Required]
        public string Name { get; set; } = string.Empty;

        [Required]
        public double ProcessingPrice { get; set; }
    }
}
