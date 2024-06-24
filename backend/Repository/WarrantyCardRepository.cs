using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs.WarrantyCard;
using backend.Helper;
using backend.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace backend.Repository
{
    public class WarrantyCardRepository : IWarrantyCardRepository
    {
        private readonly ApplicationDbContext _context;
        public WarrantyCardRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<WarrantyCardResult?> getWarrantyCards(WarrantyCardQuery query)
        {
            var warrantyCardQueries = _context.WarrantyCards.AsQueryable();

            if (query.WarrantyCardId.HasValue)
            {
                warrantyCardQueries = warrantyCardQueries.Where(x => x.WarrantyCardId == query.WarrantyCardId);
            }
            if (query.DiamondId.HasValue)
            {
                warrantyCardQueries = warrantyCardQueries.Where(x => x.DiamondId == query.DiamondId);
            }
            if (query.AccessoryId.HasValue)
            {
                warrantyCardQueries = warrantyCardQueries.Where(x => x.DiamondId == query.DiamondId);
            }
            if(query.MinDate.HasValue)
            {
                warrantyCardQueries = warrantyCardQueries.Where(x => x.StartTime >= query.MinDate);
            }
            if(query.MaxDate.HasValue)
            {
                warrantyCardQueries = warrantyCardQueries.Where(x => x.StartTime <= query.MaxDate);
            }

            var totalCount = await warrantyCardQueries.CountAsync();

            var totalPages = (int) Math.Ceiling(totalCount / (double) query.PageSize);

            var warrantyCards = await warrantyCardQueries
                .OrderByDescending(x => x.StartTime)
                .Skip(query.PageSize * (query.PageNumber - 1))
                .Take(query.PageSize)
                .Select(x => new WarrantyCardDTO
                {
                    WarrantyCardId = x.WarrantyCardId,
                    DiamondId = x.DiamondId,
                    AccessoryId = x.AccessoryId,
                    StartTime = x.StartTime,
                    EndTime = x.EndTime,
                })
                .ToListAsync();

            return new WarrantyCardResult {
                WarrantyCards = warrantyCards,
                TotalPages = totalPages,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber,
                TotalCount = totalCount
            };
        }
    }
}