
using BusinessObjects.Models;
using Helpers.DTOs.Promotion;
using Helpers.Queries;

namespace Repositories.Interfaces
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
