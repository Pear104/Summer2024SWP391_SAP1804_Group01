using BusinessObjects.Models;
using DAOs;
using Helpers.DTOs.Accessory;
using Helpers.Mappers;
using Helpers.Queries;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class AccessoryRepository : IAccessoryRepository
    {
        private readonly ApplicationDbContext _context;

        public AccessoryRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Accessory?> DeleteAccessoryAsync(long id, bool isHidden)
        {
            var deletedModel = await _context.Accessories.FirstOrDefaultAsync(x =>
                x.AccessoryId == id
            );
            if (deletedModel != null)
            {
                deletedModel.IsHidden = isHidden;
                _context.Entry(deletedModel).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return deletedModel;
            }
            return null;
        }

        public async Task<AccessoryResult> GetAllAccessoriesAsync(AccessoryQuery query)
        {
            var accessoriesQuery = _context
                .Accessories.Include(x => x.Shape)
                .Include(x => x.AccessoryType)
                .Include(x => x.AccessoryImages)
                .AsQueryable();
            if (query.Karat != 0)
            {
                accessoriesQuery = accessoriesQuery.Where(x => x.Karat == query.Karat);
            }

            if (query.IsHidden != null)
            {
                accessoriesQuery = accessoriesQuery.Where(x => x.IsHidden == query.IsHidden);
            }

            if (!string.IsNullOrEmpty(query.Name))
            {
                accessoriesQuery = accessoriesQuery.Where(x =>
                    //x.AccessoryType.Name.ToLower() == query.Name.ToLower()  //why??
                    x.Name.ToLower().Contains(query.Name.ToLower())
                );
            }

            if (!string.IsNullOrEmpty(query.Shape))
            {
                accessoriesQuery = accessoriesQuery.Where(x =>
                    x.Shape.Name.ToLower() == query.Shape.ToLower()
                );
            }

            if (query.MinMaterialWeight != 0 || query.MaxMaterialWeight != 100)
            {
                accessoriesQuery = accessoriesQuery.Where(x =>
                    x.MaterialWeight >= query.MinMaterialWeight
                    && x.MaterialWeight <= query.MaxMaterialWeight
                );
            }

            var totalCount = await accessoriesQuery.CountAsync();
            var totalPages = totalCount / query.PageSize;
            var accessories = await accessoriesQuery
                .Skip((query.PageNumber - 1) * query.PageSize)
                .Take(query.PageSize)
                .Select(x => x.ToAccessoryDTO())
                .ToListAsync();
            return new AccessoryResult
            {
                Accessories = accessories,
                TotalPages = totalPages,
                TotalCount = totalCount,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber
            };
        }

        public async Task<Accessory?> GetAccessoryByIdAsync(long id)
        {
            return await _context
                .Accessories.Include(x => x.Shape)
                .Include(x => x.AccessoryType)
                .Include(x => x.AccessoryImages)
                .FirstOrDefaultAsync(x => x.AccessoryId == id);
        }

        public async Task<Accessory?> UpdateAccessoryAsync(long id, UpdateAccessoryDTO accessoryDto)
        {
            var existingAccessory = await _context
                .Accessories.Include(x => x.AccessoryImages)
                .FirstOrDefaultAsync(x => x.AccessoryId == id);
            if (existingAccessory == null)
            {
                return null;
            }
            existingAccessory.Name = accessoryDto.Name;
            existingAccessory.Karat = accessoryDto.Karat;
            existingAccessory.MaterialWeight = accessoryDto.MaterialWeight;
            existingAccessory.Quantity = accessoryDto.Quantity;
            if (accessoryDto.Shape != existingAccessory.Shape.Name)
            {
                var shape = await _context.Shapes.FirstOrDefaultAsync(x =>
                    x.Name == accessoryDto.Shape
                );
                // Shape not found
                if (shape == null)
                {
                    return null;
                }
                existingAccessory.Shape = shape;
            }

            if (accessoryDto.AccessoryType != existingAccessory.AccessoryType.Name)
            {
                var accessoryType = await _context.AccessoryTypes.FirstOrDefaultAsync(x =>
                    x.Name == accessoryDto.AccessoryType
                );
                // Type not found
                if (accessoryType == null)
                {
                    return null;
                }
                existingAccessory.AccessoryType = accessoryType;
            }
            Console.WriteLine("Xoa hinh cu ne");
            foreach (var image in existingAccessory.AccessoryImages)
            {
                Console.WriteLine("xoa: " + image.Url);
                _context.AccessoryImages.Remove(image);
            }
            Console.WriteLine("Them hinh moi ne");
            foreach (var image in accessoryDto.AccessoryImages)
            {
                var accessoryImage = new AccessoryImage()
                {
                    Url = image,
                    Accessory = existingAccessory
                };
                Console.WriteLine("them: " + image);
                await _context.AccessoryImages.AddAsync(accessoryImage);
            }

            _context.Entry(existingAccessory).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existingAccessory;
        }

        public async Task<Accessory?> CreateAccessoryAsync(CreateAccessoryDTO accessoryDto)
        {
            var shape = await _context.Shapes.FirstOrDefaultAsync(x =>
                x.Name == accessoryDto.Shape
            );
            var accessoryType = await _context.AccessoryTypes.FirstOrDefaultAsync(x =>
                x.Name == accessoryDto.AccessoryType
            );
            if (shape == null || accessoryType == null)
            {
                return null;
            }
            var accessory = accessoryDto.ToAccessoryFromCreate();
            accessory.Shape = shape;
            accessory.AccessoryType = accessoryType;
            await _context.Accessories.AddAsync(accessory);

            foreach (var image in accessoryDto.AccessoryImages)
            {
                var accessoryImage = new AccessoryImage() { Url = image, Accessory = accessory };
                await _context.AccessoryImages.AddAsync(accessoryImage);
            }

            await _context.SaveChangesAsync();
            return accessory;
        }
    }
}
