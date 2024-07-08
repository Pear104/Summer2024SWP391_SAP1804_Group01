using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs;
using backend.DTOs.Diamond;
using backend.Enums;
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
            if (shape != null)
            {
                var diamond = diamondDto.ToDiamondFromCreate();
                diamond.Shape = shape;
                await _context.Diamonds.AddAsync(diamond);
                await _context.SaveChangesAsync();
                return diamond;
            }
            return null;
        }

        public async Task<Diamond?> DeleteDiamondAsync(long id, bool isHidden)
        {
            var model = await _context.Diamonds.FirstOrDefaultAsync(x => x.DiamondId == id);
            if (model != null)
            {
                model.IsHidden = isHidden;
                _context.Entry(model).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return model;
            }
            return null;
        }

        public async Task<DiamondResult> GetAllDiamondsAsync(DiamondQuery query)
        {
            var diamondsQuery = _context.Diamonds.Include(x => x.Shape).AsQueryable();

            // Sorting
            if (!string.IsNullOrEmpty(query.SortBy))
            {
                bool isDescending = query.IsDescending;
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
                    _ => diamondsQuery.OrderBy(x => x.Carat),
                };
            }
            if (query.SearchQuery != null)
            {
                diamondsQuery = diamondsQuery.Where(d =>
                    d.CertificateNumber.ToString().StartsWith(query.SearchQuery.ToString())
                );
            }

            bool? IsAvailability = query.IsAvailability;

            if (IsAvailability.HasValue)
            {
                diamondsQuery = diamondsQuery.Where(d => d.Availability == IsAvailability.Value);
            }

            if (query.IsHidden != null)
            {
                diamondsQuery = diamondsQuery.Where(d => d.IsHidden == query.IsHidden);
            }

            // Filtering
            if (query.MinCarat != null)
            {
                diamondsQuery = diamondsQuery.Where(x => x.Carat >= (float)query.MinCarat);
            }
            if (query.MaxCarat != null)
            {
                diamondsQuery = diamondsQuery.Where(x => x.Carat <= (float)query.MaxCarat);
            }

            if (!string.IsNullOrEmpty(query.MinColor))
            {
                diamondsQuery = diamondsQuery.Where(x =>
                    x.Color >= (Color)Enum.Parse(typeof(Color), query.MinColor)
                );
            }
            if (!string.IsNullOrEmpty(query.MaxColor))
            {
                diamondsQuery = diamondsQuery.Where(x =>
                    x.Color <= (Color)Enum.Parse(typeof(Color), query.MaxColor)
                );
            }

            if (!string.IsNullOrEmpty(query.MinClarity))
            {
                diamondsQuery = diamondsQuery.Where(x =>
                    x.Clarity >= (Clarity)Enum.Parse(typeof(Clarity), query.MinClarity)
                );
            }

            if (!string.IsNullOrEmpty(query.MaxClarity))
            {
                diamondsQuery = diamondsQuery.Where(x =>
                    x.Clarity <= (Clarity)Enum.Parse(typeof(Clarity), query.MaxClarity)
                );
            }

            if (!string.IsNullOrEmpty(query.Shape))
            {
                diamondsQuery = diamondsQuery.Where(x => x.Shape.Name == query.Shape);
            }

            var totalCount = await diamondsQuery.CountAsync();
            var totalPages = (int)Math.Ceiling(totalCount / (double)query.PageSize);

            // Pagination
            var skipNumber = (query.PageNumber - 1) * query.PageSize;
            var diamonds = await diamondsQuery
                .Skip(skipNumber)
                .Take(query.PageSize)
                .Select(x => x.ToDiamondDTO())
                .ToListAsync();

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

            if (shape != null)
            {
                existingDiamond.ShapeId = diamondDto.ShapeId;
                existingDiamond.Shape = shape;
            }
            if (diamondDto.Lab != null)
            {
                existingDiamond.Lab = diamondDto.Lab;
            }
            if (diamondDto.CertificateNumber != null)
            {
                existingDiamond.CertificateNumber = (long)diamondDto.CertificateNumber;
            }
            if (diamondDto.CertificateUrl != null)
            {
                existingDiamond.CertificateUrl = diamondDto.CertificateUrl;
            }
            if (diamondDto.Clarity != null)
            {
                existingDiamond.Clarity = (Clarity)
                    Enum.Parse(typeof(Clarity), diamondDto.Clarity.ToString());
            }
            if (diamondDto.Color != null)
            {
                existingDiamond.Color = (Color)
                    Enum.Parse(typeof(Color), diamondDto.Color.ToString()); // diamondDto.Color;
            }
            if (diamondDto.Carat != existingDiamond.Carat)
            {
                existingDiamond.Carat = (float)diamondDto.Carat;
            }
            if (diamondDto.Polish != null)
            {
                existingDiamond.Polish = diamondDto.Polish;
            }
            if (diamondDto.Symmetry != null)
            {
                existingDiamond.Symmetry = diamondDto.Symmetry;
            }
            if (diamondDto.Fluorescence != null)
            {
                existingDiamond.Fluorescence = diamondDto.Fluorescence;
            }
            if (diamondDto.ImageUrl != null)
            {
                existingDiamond.ImageUrl = diamondDto.ImageUrl;
            }
            if (diamondDto.Availability != existingDiamond.Availability)
            {
                existingDiamond.Availability = diamondDto.Availability;
            }

            _context.Entry(existingDiamond).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existingDiamond;
        }
    }
}
