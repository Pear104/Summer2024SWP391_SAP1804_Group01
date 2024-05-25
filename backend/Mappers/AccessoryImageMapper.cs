using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Accessory;
using backend.DTOs.AccessoryImage;
using backend.Models;

namespace backend.Mappers
{
    public static class AccessoryImageMapper
    {
        public static AccessoryImageDTO ToAccessoryImageDTO(this AccessoryImage accessoryImage)
        {
            return new AccessoryImageDTO
            {
                Url = accessoryImage.Url
            };
        }
    }
}