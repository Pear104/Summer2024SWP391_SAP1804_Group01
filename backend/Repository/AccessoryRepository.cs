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
    public class AccessoryRepository : IAccessoryRepository
    {
        private readonly ApplicationDbContext _context;
        public AccessoryRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Accessory> CreateAccessoryAsync(Accessory accessory)
        {
            await _context.Accessories.AddAsync(accessory);
            await _context.SaveChangesAsync();
            return accessory;
        }

        public async Task<Accessory?> DeleteAccessoryAsync(long id)
        {
            var deletedModel = await _context.Accessories.FirstOrDefaultAsync(x => x.AccessoryId == id);
            if (deletedModel != null)
            {
                _context.Accessories.Remove(deletedModel);
                await _context.SaveChangesAsync();
                return deletedModel;
            }
            return null;
        }

        public async Task<IEnumerable<Accessory>> GetAllAccessoriesAsync()
        {
            return await _context.Accessories
                .Include(x => x.Shape)
                .Include(x => x.AccessoryType)
                .Include(x => x.AccessoryImages)
                .ToListAsync();
        }

        public async Task<Accessory?> GetAccessoryByIdAsync(long id)
        {
            return await _context.Accessories
                .Include(x => x.Shape)
                .Include(x => x.AccessoryType)
                .Include(x => x.AccessoryImages)
                .FirstOrDefaultAsync(x => x.AccessoryId == id);
        }

        public async Task<Accessory?> UpdateAccessoryAsync(long id, Accessory accessory)
        {
            var existingAccessory = await _context.Accessories.FindAsync(id);
            if (existingAccessory == null)
            {
                return null;
            }
            existingAccessory = accessory;
            await _context.SaveChangesAsync();
            return existingAccessory;
        }

    }
}