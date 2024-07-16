using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.AccessoryType
{
    public class UpdateAccessoryTypeDTO
    {
        public string Name { get; set; } = string.Empty;
        public double ProcessingPrice { get; set; }
    }
}
