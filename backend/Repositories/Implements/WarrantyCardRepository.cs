using BusinessObjects.Enums;
using DAOs;
using Helpers.DTOs.WarrantyCard;
using Helpers.Mappers;
using Helpers.Queries;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class WarrantyCardRepository : IWarrantyCardRepository
    {
        private readonly ApplicationDbContext _context;

        public WarrantyCardRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<WarrantyCardResult?> getUserWarrantyCards(WarrantyCardQuery query)
        {
            var user = await _context.Accounts.FindAsync(query.CustomerId);
            if (user == null)
            {
                return null;
            }
            var warrantyCardQueries = _context
                .WarrantyCards.Include(x => x.Diamond)
                .ThenInclude(x => x.Shape)
                .Include(x => x.Accessory)
                .Where(x =>
                    x.OrderDetail!.Order.CustomerId == query.CustomerId
                    && (
                        // Only get warranty cards that have no request or have warranty requests that are completed
                        !x.WarrantyRequests.Any()
                        || x.WarrantyRequests.All(wr =>
                            wr.WarrantyStatus == WarrantyStatus.Completed
                        )
                    )
                );

            var totalCount = await warrantyCardQueries.CountAsync();

            var totalPages = (int)Math.Ceiling(totalCount / (double)query.PageSize);

            return new WarrantyCardResult
            {
                WarrantyCards = warrantyCardQueries.Select(x => x.ToWarrantyCardDTO()).ToList(),
                TotalPages = totalPages,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber,
                TotalCount = totalCount
            };
        }

        public async Task<WarrantyCardResult?> getWarrantyCards(WarrantyCardQuery query)
        {
            var warrantyCardQueries = _context
                .WarrantyCards.Include(x => x.OrderDetail)
                .ThenInclude(x => x.Order)
                .Include(x => x.Accessory)
                .ThenInclude(x => x.AccessoryImages)
                .AsQueryable();

            if (query.WarrantyCardId.HasValue)
            {
                warrantyCardQueries = warrantyCardQueries.Where(x =>
                    x.WarrantyCardId == query.WarrantyCardId
                );
            }
            // if (query.DiamondId.HasValue)
            // {
            //     warrantyCardQueries = warrantyCardQueries.Where(x =>
            //         x.DiamondId == query.DiamondId
            //     );
            // }
            // if (query.AccessoryId.HasValue)
            // {
            //     warrantyCardQueries = warrantyCardQueries.Where(x =>
            //         x.AccessoryId == query.AccessoryId
            //     );
            // }
            // if (query.MinDate.HasValue)
            // {
            //     warrantyCardQueries = warrantyCardQueries.Where(x => x.StartTime >= query.MinDate);
            // }
            // if (query.MaxDate.HasValue)
            // {
            //     warrantyCardQueries = warrantyCardQueries.Where(x => x.StartTime <= query.MaxDate);
            // }

            if (!query.CustomerName.IsNullOrEmpty())
            {
                warrantyCardQueries = warrantyCardQueries.Where(x =>
                    x.OrderDetail!.Order.Customer!.Name.Contains(query.CustomerName!)
                );
            }

            if (!query.ProductName.IsNullOrEmpty())
            {
                warrantyCardQueries = warrantyCardQueries.Where(
                    (x) =>
                        x.Accessory != null
                            ? x.Accessory.Name.Contains(query.ProductName!)
                            : (x.Diamond!.Carat + " Carat, " + x.Diamond.Shape.Name).Contains(
                                query.ProductName!
                            )
                );
            }

            var totalCount = await warrantyCardQueries.CountAsync();

            var totalPages = (int)Math.Ceiling(totalCount / (double)query.PageSize);

            var warrantyCards = await warrantyCardQueries
                .OrderByDescending(x => x.StartTime)
                .Skip(query.PageSize * (query.PageNumber - 1))
                .Take(query.PageSize)
                .Select(x => new WarrantyCardDTO
                {
                    WarrantyCardId = x.WarrantyCardId,
                    DiamondId = x.DiamondId,
                    AccessoryId = x.AccessoryId,
                    Accessory = x.Accessory != null ? x.Accessory.ToAccessoryDTO() : null,
                    Diamond = x.Diamond != null ? x.Diamond.ToDiamondDTO() : null,
                    StartTime = x.StartTime,
                    EndTime = x.EndTime,
                    CustomerName =
                        x.OrderDetail!.Order.Customer != null
                            ? x.OrderDetail.Order.Customer.Name
                            : null,
                    AccessoryName = x.Accessory != null ? x.Accessory.Name : null,
                    DiamondName =
                        x.Diamond != null
                            ? x.Diamond.Carat + " Carat, " + x.Diamond.Shape.Name
                            : null
                })
                .ToListAsync();

            return new WarrantyCardResult
            {
                WarrantyCards = warrantyCards,
                TotalPages = totalPages,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber,
                TotalCount = totalCount
            };
        }
    }
}
