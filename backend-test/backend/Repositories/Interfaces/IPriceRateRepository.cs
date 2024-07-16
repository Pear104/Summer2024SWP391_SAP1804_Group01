
using BusinessObjects.Models;
using Helpers.DTOs.PriceRate;
using Helpers.Queries;

namespace Repositories.Interfaces
{
    public interface IPriceRateRepository
    {
        Task<PriceRateResult> GetAllPriceRateAsync(PriceRateQuery query);
        Task<PriceRate?> GetLatestPriceRateAsync();
        Task<PriceRate?> CreatePriceRateAsync(long authorId, CreatePriceRateDTO priceRateDto);
    }
}
