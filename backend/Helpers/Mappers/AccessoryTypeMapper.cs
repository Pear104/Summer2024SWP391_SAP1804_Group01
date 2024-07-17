using BusinessObjects.Models;
using Helpers.DTOs.AccessoryType;

namespace Helpers.Mappers
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

        public static AccessoryType ToAccessoryTypeFromCreate(
            this CreateAccessoryTypeDTO accessoryTypeDto
        )
        {
            return new AccessoryType
            {
                Name = accessoryTypeDto.Name,
                ProcessingPrice = accessoryTypeDto.ProcessingPrice
            };
        }
    }
}
