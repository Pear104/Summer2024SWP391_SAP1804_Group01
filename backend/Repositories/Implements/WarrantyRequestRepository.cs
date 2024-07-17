using BusinessObjects.Enums;
using BusinessObjects.Models;
using DAOs;
using Helpers.DTOs.WarrantyRequest;
using Helpers.Mappers;
using Helpers.Queries;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class WarrantyRequestRepository : IWarrantyRequestRepository
    {
        private readonly ApplicationDbContext _context;

        public WarrantyRequestRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<WarrantyRequest?> CreateWarrantyRequestAsync(
            long customerId,
            CreateWarrantyRequestDTO warrantyRequestDto
        )
        {
            var customer = await _context.Accounts.FindAsync(customerId);
            if (customer == null)
            {
                return null;
            }
            var warrantyCard = await _context
                .WarrantyCards.Where(x =>
                    (
                        // Only get warranty cards that have no request or have warranty requests that are completed
                        !x.WarrantyRequests.Any()
                        || x.WarrantyRequests.All(wr =>
                            wr.WarrantyStatus == WarrantyStatus.Completed
                        )
                    )
                    && x.WarrantyCardId == warrantyRequestDto.WarrantyCardId
                )
                .FirstOrDefaultAsync();
            if (warrantyCard == null)
            {
                return null;
            }
            var warrantyRequest = warrantyRequestDto.ToWarrantyRequestFromCreate();
            warrantyRequest.Customer = customer;
            warrantyRequest.WarrantyCard = warrantyCard;

            await _context.WarrantyRequests.AddAsync(warrantyRequest);
            await _context.SaveChangesAsync();
            return warrantyRequest;
        }

        public Task<WarrantyRequest?> DeleteWarrantyRequestAsync(long id)
        {
            throw new NotImplementedException();
        }

        public async Task<WarrantyRequestResult> GetAllWarrantyRequestsAsync(
            WarrantyRequestQuery query
        )
        {
            var warrantyRequestQueries = _context
                .WarrantyRequests.Include(x => x.WarrantyCard)
                .ThenInclude(x => x.Diamond)
                .ThenInclude(x => x.Shape)
                .Include(x => x.WarrantyCard)
                .ThenInclude(x => x.Accessory)
                .Include(x => x.WarrantyStaff)
                .Include(x => x.DeliveryStaff)
                .Include(x => x.Customer)
                .AsQueryable();

            if (query.WarrantyStatus != null)
            {
                warrantyRequestQueries = warrantyRequestQueries.Where(x =>
                    x.WarrantyStatus == query.WarrantyStatus
                );
            }

            if (!query.CustomerName.IsNullOrEmpty())
            {
                warrantyRequestQueries = warrantyRequestQueries.Where(x =>
                    x.Customer!.Name.Contains(query.CustomerName)
                );
            }

            if (query.CustomerId > 0)
            {
                warrantyRequestQueries = warrantyRequestQueries.Where(x =>
                    x.CustomerId == query.CustomerId
                );
            }

            if (query.WarrantyStaffId > 0)
            {
                warrantyRequestQueries = warrantyRequestQueries.Where(x =>
                    x.WarrantyStaffId == query.WarrantyStaffId
                );
            }

            if (query.DeliveryStaffId > 0)
            {
                warrantyRequestQueries = warrantyRequestQueries.Where(x =>
                    x.DeliveryStaffId == query.DeliveryStaffId
                );
            }

            var totalCount = await warrantyRequestQueries.CountAsync();

            var totalPages = (int)Math.Ceiling((double)totalCount / query.PageSize);
            // anh duong oiiiiii
            var orderDTOs = await warrantyRequestQueries
                .Skip((query.PageNumber - 1) * query.PageSize)
                .Take(query.PageSize)
                .Select(x => x.ToWarrantyRequestDTO())
                .ToListAsync();

            return new WarrantyRequestResult
            {
                WarrantyRequests = orderDTOs,
                TotalCount = totalCount,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber,
                TotalPages = totalPages
            };
        }

        public async Task<WarrantyRequest?> GetWarrantyRequestByIdAsync(long id)
        {
            return await _context.WarrantyRequests.FindAsync(id);
        }

        public async Task<WarrantyRequest?> UpdateWarrantyRequestAsync(
            long id,
            UpdateWarrantyRequestDTO warrantyRequestDto
        )
        {
            var existedWarrantyRequest = await _context.WarrantyRequests.FirstOrDefaultAsync(x =>
                x.WarrantyRequestId.Equals(id)
            );
            if (existedWarrantyRequest == null)
            {
                return null;
            }
            if (warrantyRequestDto.WarrantyStatus != null)
            {
                existedWarrantyRequest.WarrantyStatus = Enum.Parse<WarrantyStatus>(
                    warrantyRequestDto.WarrantyStatus
                );
            }
            if (warrantyRequestDto.WarrantyStaffId != 0)
            {
                var warrantyStaff = _context.Accounts.FirstOrDefault(x =>
                    x.AccountId == warrantyRequestDto.WarrantyStaffId
                );
                existedWarrantyRequest.WarrantyStaff = warrantyStaff;
            }
            if (warrantyRequestDto.DeliveryStaffId != 0)
            {
                var deliveryStaff = _context.Accounts.FirstOrDefault(x =>
                    x.AccountId == warrantyRequestDto.DeliveryStaffId
                );
                existedWarrantyRequest.DeliveryStaff = deliveryStaff;
            }
            if (warrantyRequestDto.ReturnTime != null)
            {
                existedWarrantyRequest.ReturnTime = warrantyRequestDto.ReturnTime;
            }
            _context.Entry(existedWarrantyRequest).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existedWarrantyRequest;
        }
    }
}
