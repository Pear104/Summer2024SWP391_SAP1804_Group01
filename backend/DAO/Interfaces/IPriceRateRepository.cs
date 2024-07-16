using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.PriceRate;
using backend.Helper;
using backend.Models;

namespace backend.Interfaces
{
    public interface IPriceRateRepository
    {
        Task<PriceRateResult> GetAllPriceRateAsync(PriceRateQuery query);
        Task<PriceRate?> GetLatestPriceRateAsync();
        Task<PriceRate?> CreatePriceRateAsync(long authorId, CreatePriceRateDTO priceRateDto);
    }
}