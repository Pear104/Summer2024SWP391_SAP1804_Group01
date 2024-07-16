using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Promotion;
using backend.Services.Helper;
using backend.Models;

namespace backend.Interfaces
{
    public interface IPromotionRepository
    {
        Task<PromotionResult> GetAllPromotionAsync(PromotionQuery query);
        Task<Promotion?> CreatePromotionAsync( CreatePromotionDTO promotionDto);
        Task<List<Promotion>> GetPromotionActive();
        Task<Promotion?> GetPromotionByCodeAsync(string code);
        Task<Promotion?> UpdatePromotionAsync(string code, UpdatePromotionDTO promotionDto);
    }
}