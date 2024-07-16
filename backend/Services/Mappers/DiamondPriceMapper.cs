using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.DTOs.DiamondPrice;
using backend.BusinessOjects.Models;

namespace backend.Services.Mappers
{
    public static class DiamondPriceMapper
    {
        public static DiamondPriceDTO ToDiamondPriceDTO(this DiamondPrice diamondPriceDto)
        {
            return new DiamondPriceDTO
            {
                DiamondPriceId = diamondPriceDto.DiamondPriceId,
                Color = diamondPriceDto.Color.ToString(),
                Clarity = diamondPriceDto.Clarity.ToString(),
                EffTime = diamondPriceDto.EffTime,
                MaxCaratEff = diamondPriceDto.MaxCaratEff,
                MinCaratEff = diamondPriceDto.MinCaratEff,
                UnitPrice = diamondPriceDto.UnitPrice
            };
        }

        public static DiamondPrice ToDiamondPriceFromCreate(
            this CreateDiamondPriceDTO diamondPriceDto
        )
        {
            return new DiamondPrice()
            {
                Color = diamondPriceDto.Color,
                Clarity = diamondPriceDto.Clarity,
                MinCaratEff = diamondPriceDto.MinCaratEff,
                MaxCaratEff = diamondPriceDto.MaxCaratEff,
                UnitPrice = diamondPriceDto.UnitPrice
            };
        }
    }
}
