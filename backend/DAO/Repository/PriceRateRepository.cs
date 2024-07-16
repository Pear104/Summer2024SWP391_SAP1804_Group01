using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs.Blog;
using backend.DTOs.PriceRate;
using backend.Services.Helper;
using backend.Interfaces;
using backend.Services.Mappers;
using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Repository
{
    public class PriceRateRepository : IPriceRateRepository
    {
        private readonly ApplicationDbContext _context;

        public PriceRateRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<PriceRateResult> GetAllPriceRateAsync(PriceRateQuery query)
        {
            var priceRateQueries = _context.PriceRates.Include(x => x.Account).OrderByDescending(x => x.CreatedAt).AsQueryable();

            if (query.SearchCreatedAt.HasValue)
            {
                priceRateQueries = priceRateQueries.Where(pr =>
                    pr.CreatedAt <= query.SearchCreatedAt
                );
            }

            var totalCount = await priceRateQueries.CountAsync();
            var totalPages = (int)Math.Ceiling((double)totalCount / query.PageSize);

            var priceRates = await priceRateQueries
                .Skip((query.PageNumber - 1) * query.PageSize)
                .Take(query.PageSize)
                .ToListAsync();

            return new PriceRateResult{
                PriceRates = priceRates.Select(x => x.ToPriceRateDTO()).ToList(),
                TotalCount = totalCount,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber,
                TotalPages = totalPages,
            };
        }

        public async Task<PriceRate?> CreatePriceRateAsync(long authorId, CreatePriceRateDTO priceRateDto)
        {
            var author = await _context.Accounts.FindAsync(authorId);
            if (author == null)
            {
                return null;
            }
            var priceRate = priceRateDto.ToPriceRateFromCreate();
            priceRate.Account = author;

            await _context.PriceRates.AddAsync(priceRate);
            await _context.SaveChangesAsync();
            return priceRate;
        }

        public async Task<PriceRate?> GetLatestPriceRateAsync()
        {
            var existingPriceRate = await _context.PriceRates.OrderByDescending(x => x.CreatedAt).FirstOrDefaultAsync();
            return existingPriceRate;
        }
    }
}