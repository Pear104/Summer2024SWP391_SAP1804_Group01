using BusinessObjects.Models;
using Helpers.DTOs.Promotion;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface IPromotionService
    {
        Task<PromotionResult> GetAllPromotion(PromotionQuery query);
        Task<Promotion?> CreatePromotion(CreatePromotionDTO promotionDto);
        Task<List<Promotion>> GetPromotionActive();
        Task<Promotion?> GetPromotionByCode(string code);
        Task<Promotion?> UpdatePromotion(string code, UpdatePromotionDTO promotionDto);
    }
}
