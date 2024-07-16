using backend.BusinessOjects.Models;
using backend.Services.DTOs.Accessory;

namespace backend.Services.Mappers
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
                Quantity = accessory.Quantity,
                AccessoryType = accessory.AccessoryType.ToAccessoryTypeDTO(),
                AccessoryImages = accessory
                    .AccessoryImages.Select(x => x.ToAccessoryImageDTO())
                    .ToList(),
                Feedbacks = accessory.Feedbacks.Select(x => x.ToFeedbackDTO()).ToList()
            };
        }

        public static Accessory ToAccessoryFromCreate(this CreateAccessoryDTO accessoryDto)
        {
            return new Accessory
            {
                Karat = accessoryDto.Karat,
                Quantity = accessoryDto.Quantity,
                MaterialWeight = accessoryDto.MaterialWeight,
                Name = accessoryDto.Name,
            };
        }
    }
}
