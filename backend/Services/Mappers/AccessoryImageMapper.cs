using backend.BusinessOjects.Models;
using backend.Services.DTOs.AccessoryImage;

namespace backend.Services.Mappers
{
    public static class AccessoryImageMapper
    {
        public static AccessoryImageDTO ToAccessoryImageDTO(this AccessoryImage accessoryImage)
        {
            return new AccessoryImageDTO { Url = accessoryImage.Url };
        }
    }
}
