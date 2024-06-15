using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs.Blog;
using backend.DTOs.PriceRate;
using backend.Interfaces;
using backend.Mappers;
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

        public async Task<IEnumerable<PriceRate>> GetAllPriceRateAsync()
        {
             var existingPriceRate = await _context.PriceRates.ToListAsync();
            return existingPriceRate;
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

        public Task<PriceRate?> DeleteBlogAsync(long id)
        {
            throw new NotImplementedException();
        }

        public async Task<PriceRate?> GetLatestPriceRateAsync()
        {
             var existingPriceRate = await _context.PriceRates.OrderByDescending(x => x.CreatedAt).FirstOrDefaultAsync();
            return existingPriceRate;
        }
    }
}
