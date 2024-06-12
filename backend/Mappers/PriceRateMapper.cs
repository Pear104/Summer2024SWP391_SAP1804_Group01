using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.PriceRate;
using backend.Models;


namespace backend.Mappers
{
    public static class PriceRateMapper
    {
        public static PriceRateDTO ToPriceRateDTO(this PriceRate priceRate)
        {
            return new PriceRateDTO
            {
                Percent = priceRate.Percent,
                CreatedAt = priceRate.CreatedAt,
                PriceRateId = priceRate.PriceRateId,
                Account = priceRate.Account.ToAccountDTO(),
            };
        }

        public static PriceRate ToPriceRateFromCreate(this CreatePriceRateDTO priceRateDto)
        {
            return new PriceRate() { Percent = priceRateDto.Percent };
        }
    }
}