using BusinessObjects.Models;
using Helpers.DTOs.PriceRate;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class PriceRateService : IPriceRateService
    {
        private readonly IPriceRateRepository _priceRateRepository;

        public PriceRateService(IPriceRateRepository priceRateRepository)
        {
            _priceRateRepository = priceRateRepository;
        }

        public Task<PriceRate?> CreatePriceRate(long authorId, CreatePriceRateDTO priceRateDto)
        {
            return _priceRateRepository.CreatePriceRateAsync(authorId, priceRateDto);
        }

        public Task<PriceRateResult> GetAllPriceRate(PriceRateQuery query)
        {
            return _priceRateRepository.GetAllPriceRateAsync(query);
        }

        public Task<PriceRate?> GetLatestPriceRate()
        {
            return _priceRateRepository.GetLatestPriceRateAsync();
        }
    }
}
