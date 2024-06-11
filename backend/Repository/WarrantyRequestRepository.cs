using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs.WarrantyRequest;
using backend.Interfaces;
using backend.Mappers;
using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Repository
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
            var warrantyRequest = warrantyRequestDto.ToWarrantyRequestFromCreate();
            var warrantyCard = await _context.WarrantyCards.FindAsync(
                warrantyRequestDto.WarrantyCardId
            );
            if (warrantyCard == null)
            {
                return null;
            }
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

        public async Task<IEnumerable<WarrantyRequest>> GetAllWarrantyRequestsAsync()
        {
            var existingWarrantyRequests = await _context
                .WarrantyRequests.Include(x => x.WarrantyCard)
                .ThenInclude(x => x.OrderDetail)
                .ThenInclude(x => x.Diamond)
                .ThenInclude(x => x.Shape)
                .Include(x => x.WarrantyCard)
                .ThenInclude(x => x.OrderDetail)
                .ThenInclude(x => x.Accessory)
                .ToListAsync();
            return existingWarrantyRequests;
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
            throw new NotImplementedException();
        }
    }
}
