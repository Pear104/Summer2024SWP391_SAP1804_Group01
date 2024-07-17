using BusinessObjects.Models;
using DAOs;
using Helpers.DTOs.DiamondPrice;
using Helpers.Mappers;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class DiamondPriceRepository : IDiamondPriceRepository
    {
        private readonly ApplicationDbContext _context;

        public DiamondPriceRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<DiamondPrice?> CreateDiamondPriceAsync(
            CreateDiamondPriceDTO diamondPriceDto
        )
        {
            var diamondPrice = diamondPriceDto.ToDiamondPriceFromCreate();
            await _context.DiamondPrices.AddAsync(diamondPrice);
            await _context.SaveChangesAsync();
            return diamondPrice;
        }

        public async Task<IEnumerable<DiamondPrice>> GetAllDiamondPricesAsync()
        {
            var latestDiamondPricesQuery = _context
                .DiamondPrices.GroupBy(x => new
                {
                    x.Clarity,
                    x.Color,
                    x.MinCaratEff,
                    x.MaxCaratEff
                })
                .Select(group => group.OrderByDescending(x => x.EffTime).FirstOrDefault());
            var latestDiamondPrices = await latestDiamondPricesQuery.ToListAsync();
            return latestDiamondPrices;
        }

        public async Task<DiamondPrice?> GetDiamondPriceByIdAsync(long id)
        {
            return await _context.DiamondPrices.FindAsync(id);
        }
    }
}
