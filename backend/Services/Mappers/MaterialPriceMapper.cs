using backend.BusinessOjects.Models;
using backend.Services.DTOs.DiamondPrice;

namespace backend.Services.Mappers
{
    public static class MaterialPriceMapper
    {
        public static MaterialPriceDTO ToMaterialPriceDTO(this MaterialPrice materialPriceDto)
        {
            return new MaterialPriceDTO
            {
                MaterialPriceId = materialPriceDto.MaterialPriceId,
                Karat = materialPriceDto.Karat,
                EffTime = materialPriceDto.EffTime,
                UnitPrice = materialPriceDto.UnitPrice
            };
        }

        public static MaterialPrice ToMaterialPriceFromCreate(
            this CreateMaterialPriceDTO materialPriceDto
        )
        {
            return new MaterialPrice()
            {
                Karat = materialPriceDto.Karat,
                EffTime = materialPriceDto.EffTime,
                UnitPrice = materialPriceDto.UnitPrice
            };
        }
    }
}
