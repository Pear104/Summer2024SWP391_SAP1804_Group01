using BusinessObjects.Models;
using Helpers.DTOs.Promotion;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class PromotionService : IPromotionService
    {
        private readonly IPromotionRepository _promotionRepository;

        public PromotionService(IPromotionRepository promotionRepository)
        {
            _promotionRepository = promotionRepository;
        }

        public Task<Promotion?> CreatePromotion(CreatePromotionDTO promotionDto)
        {
            return _promotionRepository.CreatePromotionAsync(promotionDto);
        }

        public Task<PromotionResult> GetAllPromotion(PromotionQuery query)
        {
            return _promotionRepository.GetAllPromotionAsync(query);
        }

        public Task<List<Promotion>> GetPromotionActive()
        {
            return _promotionRepository.GetPromotionActive();
        }

        public Task<Promotion?> GetPromotionByCode(string code)
        {
            return _promotionRepository.GetPromotionByCodeAsync(code);
        }

        public Task<Promotion?> UpdatePromotion(string code, UpdatePromotionDTO promotionDto)
        {
            return _promotionRepository.UpdatePromotionAsync(code, promotionDto);
        }
    }
}
