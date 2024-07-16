using backend.BusinessOjects.Models;
using backend.Services.DTOs.PriceRate;
using backend.Services.QueriesHelper;

namespace backend.Interfaces
{
    public interface IPriceRateRepository
    {
        Task<PriceRateResult> GetAllPriceRateAsync(PriceRateQuery query);
        Task<PriceRate?> GetLatestPriceRateAsync();
        Task<PriceRate?> CreatePriceRateAsync(long authorId, CreatePriceRateDTO priceRateDto);
    }
}
