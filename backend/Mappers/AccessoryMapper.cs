using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Accessory;
using backend.Models;

namespace backend.Mappers
{
    public static class AccessoryMapper
    {
        public static AccessoryDTO ToAccessoryDTO(this Accessory accessory)
        {
            return new AccessoryDTO
            {
                AccessoryId = accessory.AccessoryId,
                Karat = accessory.Karat,
                MaterialWeight = accessory.MaterialWeight,
                Name = accessory.Name,
                Shape = accessory.Shape.ToShapeDTO(),
                AccessoryType = accessory.AccessoryType.ToAccessoryTypeDTO(),
                AccessoryImages = accessory.AccessoryImages.Select(x => x.ToAccessoryImageDTO()).ToList(),
            };
        }
    }
}