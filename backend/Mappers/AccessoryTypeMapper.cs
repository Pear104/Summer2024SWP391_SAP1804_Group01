using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Models;

namespace backend.Mappers
{
    public static class AccessoryTypeMapper
    {
        public static AccessoryTypeDTO ToAccessoryTypeDTO(this AccessoryType accessoryType)
        {
            return new AccessoryTypeDTO
            {
                Name = accessoryType.Name,
                ProcessingPrice = accessoryType.ProcessingPrice
            };
        }
    }
}