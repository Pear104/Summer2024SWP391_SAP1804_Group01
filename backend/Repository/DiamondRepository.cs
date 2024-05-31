using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs;
using backend.DTOs.Diamond;
using backend.Helper;
using backend.Interfaces;
using backend.Mappers;
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

        public async Task<Diamond?> CreateDiamondAsync(CreateDiamondDTO diamondDto)
        {
            var existingDiamond = await _context.Diamonds.FirstOrDefaultAsync(x =>
                x.CertificateNumber == diamondDto.CertificateNumber
            );
            if (existingDiamond != null)
            {
                return null;
            }
            var shape = await _context.Shapes.FindAsync(diamondDto.ShapeId);
            var diamond = diamondDto.ToDiamondFromCreate();
            diamond.Shape = shape;
            await _context.Diamonds.AddAsync(diamond);
            await _context.SaveChangesAsync();
            return diamond;
        }

        public async Task<Diamond?> DeleteDiamondAsync(long id)
        {
            var deletedModel = await _context
                .Diamonds.Include(x => x.Shape)
                .FirstOrDefaultAsync(x => x.DiamondId == id);
            if (deletedModel != null)
            {
                _context.Diamonds.Remove(deletedModel);
                await _context.SaveChangesAsync();
                return deletedModel;
            }
            return null;
        }

        public async Task<DiamondResult> GetAllDiamondsAsync(DiamondQuery query)
        {
            var diamondsQuery = _context.Diamonds.Include(x => x.Shape).AsQueryable();

            // Sorting
            if (!string.IsNullOrEmpty(query.SortBy))
            {
                bool isDescending = query.IsDecsending;
                diamondsQuery = query.SortBy.ToLower() switch
                {
                    "lab"
                        => isDescending
                            ? diamondsQuery.OrderByDescending(x => x.Lab)
                            : diamondsQuery.OrderBy(x => x.Lab),
                    "carat"
                        => isDescending
                            ? diamondsQuery.OrderByDescending(x => x.Carat)
                            : diamondsQuery.OrderBy(x => x.Carat),
                    "color"
                        => isDescending
                            ? diamondsQuery.OrderByDescending(x => x.Color)
                            : diamondsQuery.OrderBy(x => x.Color),
                    "clarity"
                        => isDescending
                            ? diamondsQuery.OrderByDescending(x => x.Clarity)
                            : diamondsQuery.OrderBy(x => x.Clarity),
                    "shape"
                        => isDescending
                            ? diamondsQuery.OrderByDescending(x => x.ShapeId)
                            : diamondsQuery.OrderBy(x => x.ShapeId),
                    "cut"
                        => isDescending
                            ? diamondsQuery.OrderByDescending(x => x.Cut)
                            : diamondsQuery.OrderBy(x => x.Cut),
                    _ => diamondsQuery
                };
            }

            // Filtering
            if (!string.IsNullOrEmpty(query.MinCarat))
            {
                var minCarat = float.Parse(query.MinCarat);
                diamondsQuery = diamondsQuery.Where(x => x.Carat >= minCarat);
            }
            if (!string.IsNullOrEmpty(query.MaxCarat))
            {
                var maxCarat = float.Parse(query.MaxCarat);
                diamondsQuery = diamondsQuery.Where(x => x.Carat <= maxCarat);
            }

            // Get the total count of filtered records
            var totalCount = await diamondsQuery.CountAsync();

            // Pagination
            var skipNumber = (query.PageNumber - 1) * query.PageSize;
            var diamonds = await diamondsQuery
                .Skip(skipNumber)
                .Take(query.PageSize)
                .Select(x =>
                    x.ToDiamondDTO()
                // new DiamondDTO()
                // {
                //     ImageUrl = x.ImageUrl,
                //     DiamondId = x.DiamondId,
                //     Lab = x.Lab,
                //     Carat = x.Carat,
                //     Cut = x.Cut,
                //     Color = x.Color.ToString(),
                //     Clarity = x.Clarity.ToString(),
                //     Shape = x.ShapeId.ToString(),
                // }
                )
                .ToListAsync();

            // Calculate the total number of pages
            var totalPages = (int)Math.Ceiling(totalCount / (double)query.PageSize);

            return new DiamondResult
            {
                Diamonds = diamonds,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber,
                TotalPages = totalPages,
                TotalCount = totalCount
            };
        }

        public async Task<Diamond?> GetDiamondByIdAsync(long id)
        {
            return await _context
                .Diamonds.Include(x => x.Shape)
                .FirstOrDefaultAsync(x => x.DiamondId == id);
        }

        public async Task<Diamond?> UpdateDiamondAsync(long id, UpdateDiamondDTO diamondDto)
        {
            var existingDiamond = await _context.Diamonds.FindAsync(id);
            if (existingDiamond == null)
            {
                return null;
            }
            var shape = await _context.Shapes.FindAsync(diamondDto.ShapeId);

            existingDiamond.Lab = diamondDto.Lab;
            existingDiamond.CertificateUrl = diamondDto.CertificateUrl;
            existingDiamond.Availability = diamondDto.Availability;
            existingDiamond.CertificateNumber = diamondDto.CertificateNumber;
            existingDiamond.Carat = diamondDto.Carat;
            existingDiamond.Clarity = diamondDto.Clarity;
            existingDiamond.Color = diamondDto.Color;
            existingDiamond.Cut = diamondDto.Cut;
            existingDiamond.ImageUrl = diamondDto.ImageUrl;
            existingDiamond.Symmetry = diamondDto.Symmetry;
            existingDiamond.Polish = diamondDto.Polish;
            existingDiamond.Fluorescence = diamondDto.Fluorescence;
            existingDiamond.Shape = shape;

            _context.Entry(existingDiamond).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existingDiamond;
        }
    }
}
