using BusinessObjects.Models;
using Helpers.DTOs.WarrantyCard;

namespace Helpers.Mappers
{
    public static class WarrantyCardMapper
    {
        public static WarrantyCardDTO ToWarrantyCardDTO(this WarrantyCard WarrantyCard)
        {
            var diamond = WarrantyCard.Diamond;
            return new WarrantyCardDTO
            {
                WarrantyCardId = WarrantyCard!.WarrantyCardId,
                AccessoryId = WarrantyCard.AccessoryId,
                DiamondId = WarrantyCard.DiamondId,
                StartTime = WarrantyCard.StartTime,
                EndTime = WarrantyCard.EndTime,
                DiamondName =
                    WarrantyCard.Diamond != null
                        ? $"{diamond!.Carat} ct {diamond.Shape.Name} Shape Diamond #{diamond.CertificateNumber}"
                        : null,
                AccessoryName = WarrantyCard.Accessory != null ? WarrantyCard.Accessory.Name : null,
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
