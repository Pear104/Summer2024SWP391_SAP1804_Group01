using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.Interfaces;
using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Repository
{
    public class DiamondRepository : IDiamondRepository
    {
        private readonly ApplicationDbContext _context;
        public DiamondRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Diamond> CreateDiamondAsync(Diamond diamond)
        {
            await _context.Diamonds.AddAsync(diamond);
            await _context.SaveChangesAsync();
            return diamond;
        }

        public async Task<Diamond?> DeleteDiamondAsync(long id)
        {
            var deletedModel = await _context.Diamonds.Include(x => x.Shape).FirstOrDefaultAsync(x => x.DiamondId == id);
            if (deletedModel != null)
            {
                _context.Diamonds.Remove(deletedModel);
                await _context.SaveChangesAsync();
                return deletedModel;
            }
            return null;
        }

        public async Task<IEnumerable<Diamond>> GetAllDiamondsAsync()
        {
            return await _context.Diamonds.Include(x => x.Shape).ToListAsync();
        }

        public async Task<Diamond?> GetDiamondByIdAsync(long id)
        {
            return await _context.Diamonds.Include(x => x.Shape).FirstOrDefaultAsync(x => x.DiamondId == id);
        }

        public async Task<Diamond?> UpdateDiamondAsync(long id, Diamond diamond)
        {
            var existingDiamond = await _context.Diamonds.FindAsync(id);
            if (existingDiamond == null)
            {
                return null;
            }
            existingDiamond = diamond;
            await _context.SaveChangesAsync();
            return existingDiamond;
        }
    }
}