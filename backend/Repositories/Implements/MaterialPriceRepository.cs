using BusinessObjects.Models;
using DAOs;
using Helpers.DTOs.MaterialPrice;
using Helpers.Mappers;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class MaterialPriceRepository : IMaterialPriceRepository
    {
        private readonly ApplicationDbContext _context;

        public MaterialPriceRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<MaterialPrice?> CreateMaterialPriceAsync(
            CreateMaterialPriceDTO materialPriceDto
        )
        {
            var materialPrice = materialPriceDto.ToMaterialPriceFromCreate();
            await _context.MaterialPrices.AddAsync(materialPrice);
            await _context.SaveChangesAsync();
            return materialPrice;
        }

        public async Task<IEnumerable<MaterialPrice>> GetAllMaterialPricesAsync()
        {
            var latestMaterialPricesQuery = _context
                .MaterialPrices.GroupBy(x => new { x.Karat })
                .Select(group => group.OrderByDescending(x => x.EffTime).FirstOrDefault());
            var latestMaterialPrices = await latestMaterialPricesQuery.ToListAsync();
            return latestMaterialPrices;
        }

        public async Task<MaterialPrice?> GetMaterialPriceByIdAsync(long id)
        {
            return await _context.MaterialPrices.FindAsync(id);
        }
    }
}
