using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs.Accessory;
using backend.DTOs.AccessoryType;
using backend.Services.Helper;
using backend.Interfaces;
using backend.Services.Mappers;
using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Repository
{
    public class AccessoryTypeRepository : IAccessoryTypeRepository
    {
        private readonly ApplicationDbContext _context;

        public AccessoryTypeRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<AccessoryType?> CreateAccessoryTypeAsync(
            CreateAccessoryTypeDTO accessoryTypeDto
        )
        {
            var newAccessoryType = await _context.AccessoryTypes.FirstOrDefaultAsync(x =>
                x.Name == accessoryTypeDto.Name
            );
            if (newAccessoryType == null)
            {
                newAccessoryType = accessoryTypeDto.ToAccessoryTypeFromCreate();
                await _context.AccessoryTypes.AddAsync(newAccessoryType);
                await _context.SaveChangesAsync();
                return newAccessoryType;
            }
            return null;
        }

        public async Task<AccessoryType?> DeleteAccessoryTypeAsync(long id)
        {
            var deletedModel = await _context.AccessoryTypes.FindAsync(id);
            if (deletedModel != null)
            {
                _context.AccessoryTypes.Remove(deletedModel);
                await _context.SaveChangesAsync();
                return deletedModel;
            }
            return null;
        }

        public async Task<AccessoryType?> GetAccessoryTypeByIdAsync(long id)
        {
            return await _context.AccessoryTypes.FindAsync(id);
        }

        public async Task<IEnumerable<AccessoryType>> GetAllAccessoryTypesAsync()
        {
            var accessoryTypes = await _context.AccessoryTypes.ToListAsync();
            return accessoryTypes;
        }

        public async Task<AccessoryType?> UpdateAccessoryTypeAsync(
            long id,
            UpdateAccessoryTypeDTO accessoryTypeDto
        )
        {
            var existingAccessoryType = await _context.AccessoryTypes.FindAsync(id);
            if (existingAccessoryType == null)
            {
                return null;
            }

            existingAccessoryType.Name = accessoryTypeDto.Name;
            existingAccessoryType.ProcessingPrice = accessoryTypeDto.ProcessingPrice;

            _context.Entry(existingAccessoryType).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existingAccessoryType;
        }
    }
}
