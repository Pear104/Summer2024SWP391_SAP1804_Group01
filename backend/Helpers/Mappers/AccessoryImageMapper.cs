
using BusinessObjects.Models;
using Helpers.DTOs.AccessoryImage;

namespace Helpers.Mappers
{
    public static class AccessoryImageMapper
    {
        public static AccessoryImageDTO ToAccessoryImageDTO(this AccessoryImage accessoryImage)
        {
            return new AccessoryImageDTO { Url = accessoryImage.Url };
        }
    }
}
