
using BusinessObjects.Models;
using Helpers.DTOs.WarrantyCard;

namespace Helpers.Mappers
{
    public static class WarrantyCardMapper
    {
        public static WarrantyCardDTO ToWarrantyCardDTO(this WarrantyCard WarrantyCard)
        {
            return new WarrantyCardDTO
            {
                WarrantyCardId = WarrantyCard.WarrantyCardId,
                AccessoryId = WarrantyCard.AccessoryId,
                DiamondId = WarrantyCard.DiamondId,
                StartTime = WarrantyCard.StartTime,
                EndTime = WarrantyCard.EndTime
            };
        }

        // public static WarrantyCard ToWarrantyCardFromCreate(this CreateWarrantyCardDTO WarrantyCard)
        // {
        //     return new WarrantyCard
        //     {
        //         AccessoryId = WarrantyCard.AccessoryId,
        //         DiamondId = WarrantyCard.DiamondId,
        //         StartTime = WarrantyCard.StartTime,
        //         EndTime = WarrantyCard.EndTime
        //     };
        // }
    }
}
