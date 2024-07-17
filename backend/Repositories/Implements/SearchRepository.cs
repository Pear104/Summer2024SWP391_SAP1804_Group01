using DAOs;
using Helpers.DTOs.Accessory;
using Helpers.DTOs.Diamond;
using Helpers.DTOs.Search;
using Helpers.DTOs.Shape;
using Helpers.Mappers;
using Helpers.Queries;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class SearchRepository : ISearchRepository
    {
        private readonly ApplicationDbContext _context;

        public SearchRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<SearchResult> GetResult(SearchQuery query)
        {
            var diamonds = _context.Diamonds.Include(d => d.Shape).AsQueryable();

            var accessories = _context
                .Accessories.Include(a => a.Shape)
                .Include(a => a.AccessoryImages)
                .AsQueryable();

            if (!string.IsNullOrEmpty(query.keyword))
            {
                var searchValue = query.keyword.ToLower();

                diamonds = diamonds.Where(d =>
                    d.Lab.ToLower().Contains(searchValue)
                    ||
                    // d.CertificateNumber.ToString().Contains(searchValue) ||
                    // d.Color.ToString().ToLower().Contains(searchValue) ||
                    // d.Clarity.ToString().Contains(searchValue) ||
                    d.Shape.Name.ToLower().Contains(searchValue)
                );

                accessories = accessories.Where(a =>
                    a.Name.ToLower().Contains(searchValue)
                    || a.Shape.Name.ToLower().Contains(searchValue)
                );
            }

            // Pagination
            var totalDiamonds = await diamonds.CountAsync();
            var totalAccessories = await accessories.CountAsync();

            var totalCount = totalDiamonds + totalAccessories;
            var totalPages = (int)Math.Ceiling((double)totalCount / query.PageSize);

            var diamondsToReturn = await diamonds
                .Skip((query.PageNumber - 1) * query.PageSize)
                .Take(query.PageSize)
                .AsNoTracking()
                .ToListAsync();

            var accessoriesToReturn = await accessories
                .Skip((query.PageNumber - 1) * query.PageSize)
                .Take(query.PageSize)
                .AsNoTracking()
                .ToListAsync();

            var diamondDTOs = diamondsToReturn
                .Select(d => new DiamondDTO
                {
                    DiamondId = d.DiamondId,
                    Lab = d.Lab,
                    CertificateNumber = d.CertificateNumber,
                    CertificateUrl = d.CertificateUrl,
                    ImageUrl = d.ImageUrl,
                    Carat = d.Carat,
                    Cut = d.Cut,
                    // Color = d.Color.ToString(),
                    // Clarity = d.Clarity.ToString(),
                    Polish = d.Polish,
                    Symmetry = d.Symmetry,
                    Fluorescence = d.Fluorescence,
                    Availability = d.Availability,
                    Shape = d.Shape.Name,
                    ShapeId = d.ShapeId
                })
                .ToList();

            var accessoryDTOs = accessoriesToReturn
                .Select(a => new AccessoryDTO
                {
                    AccessoryId = a.AccessoryId,
                    Karat = a.Karat,
                    MaterialWeight = a.MaterialWeight,
                    Name = a.Name,
                    Quantity = a.Quantity,
                    Shape = new ShapeDTO { Name = a.Shape.Name },
                    AccessoryImages = a
                        .AccessoryImages.Select(z => z.ToAccessoryImageDTO())
                        .ToList(),
                    // Feedbacks = a.Feedbacks
                })
                .ToList();
            return new SearchResult
            {
                Diamonds = diamondDTOs,
                Accessories = accessoryDTOs,
                TotalPages = totalPages,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber,
                TotalCount = totalCount
            };
        }
    }
}
