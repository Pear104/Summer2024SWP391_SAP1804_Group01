using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs.Promotion;
using backend.Helper;
using backend.Interfaces;
using backend.Mappers;
using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Repository
{
    public class PromotionRepository : IPromotionRepository
    {
        private readonly ApplicationDbContext _context;

        public PromotionRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Promotion?> CreatePromotionAsync(CreatePromotionDTO promotionDto)
        {
            var promotion = promotionDto.ToPromotionFromCreate();
            await _context.Promotions.AddAsync(promotion);
            await _context.SaveChangesAsync();
            return promotion;
        }

        public async Task<PromotionResult> GetAllPromotionAsync(PromotionQuery query)
        {
            var promotionQueries = _context.Promotions;

            var totalCount = await promotionQueries.CountAsync();
            var totalPages = (int)Math.Ceiling((double)totalCount / query.PageSize);

            var promotions = await promotionQueries
                                    .OrderByDescending(p => p.StartTime)
                                    .ThenByDescending(p => p.EndTime)
                                    .Skip((query.PageNumber - 1) * query.PageSize)
                                    .Take(query.PageSize)
                                    .ToListAsync();

            return new PromotionResult
            {
                Promotion = promotions.Select(x => x.ToPromotionDTO()).ToList(),
                TotalCount = totalCount,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber,
                TotalPages = totalPages,
            };
        }
        public async Task<List<Promotion>> GetPromotionActive()
        {
            return await _context
             .Promotions
             .Where(x => x.EndTime > DateTime.Now && x.StartTime < DateTime.Now)
             .OrderByDescending(x => x.DiscountPercent)
             .ToListAsync();

        }

        public async Task<Promotion?> GetPromotionByCodeAsync(string code)
        {
            return await _context
                .Promotions
                .FirstOrDefaultAsync(x => x.PromotionCode == code);
        }

        public async Task<Promotion?> UpdatePromotionAsync(string code, UpdatePromotionDTO promotionDto)
        {
            var existingPromotion = await _context.Promotions.FirstOrDefaultAsync(a => a.PromotionCode == code);
            if (existingPromotion == null)
            {
                return null;
            }

            existingPromotion.DiscountPercent = promotionDto.DiscountPercent;
            existingPromotion.StartTime = promotionDto.StartTime;
            existingPromotion.EndTime = promotionDto.EndTime;

            _context.Entry(existingPromotion).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existingPromotion;
        }
    }
}