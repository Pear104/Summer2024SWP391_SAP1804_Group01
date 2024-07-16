using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.DTOs.Accessory;
using backend.Services.DTOs.AccessoryImage;
using backend.BusinessOjects.Models;

namespace backend.Services.Mappers
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