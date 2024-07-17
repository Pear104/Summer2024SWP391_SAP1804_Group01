
using BusinessObjects.Models;
using Helpers.DTOs.Promotion;

namespace Helpers.Mappers
{
    public static class PromotionMapper
    {
        public static PromotionDTO ToPromotionDTO(this Promotion promotion)
        {
            return new PromotionDTO
            {
                PromotionId = promotion.PromotionId,
                PromotionName = promotion.PromotionName,
                PromotionCode = promotion.PromotionCode,
                DiscountPercent = promotion.DiscountPercent,
                StartTime = promotion.StartTime,
                EndTime = promotion.EndTime,
            };
        }

        public static Promotion ToPromotionFromCreate(this CreatePromotionDTO promotionDTO)
        {
            return new Promotion
            {
                PromotionName = promotionDTO.PromotionName,
                PromotionCode = promotionDTO.PromotionCode,
                DiscountPercent = promotionDTO.DiscountPercent,
                StartTime = promotionDTO.StartTime,
                EndTime = promotionDTO.EndTime
            };
        }
    }
}
