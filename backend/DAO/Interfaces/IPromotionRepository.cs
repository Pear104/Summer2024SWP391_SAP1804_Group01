using backend.BusinessOjects.Models;
using backend.Services.DTOs.Promotion;
using backend.Services.QueriesHelper;

namespace backend.Interfaces
{
    public interface IPromotionRepository
    {
        Task<PromotionResult> GetAllPromotionAsync(PromotionQuery query);
        Task<Promotion?> CreatePromotionAsync(CreatePromotionDTO promotionDto);
        Task<List<Promotion>> GetPromotionActive();
        Task<Promotion?> GetPromotionByCodeAsync(string code);
        Task<Promotion?> UpdatePromotionAsync(string code, UpdatePromotionDTO promotionDto);
    }
}
