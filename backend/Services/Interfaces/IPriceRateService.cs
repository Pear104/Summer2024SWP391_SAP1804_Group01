using BusinessObjects.Models;
using Helpers.DTOs.PriceRate;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface IPriceRateService
    {
        Task<PriceRateResult> GetAllPriceRate(PriceRateQuery query);
        Task<PriceRate?> GetLatestPriceRate();
        Task<PriceRate?> CreatePriceRate(long authorId, CreatePriceRateDTO priceRateDto);
    }
}
