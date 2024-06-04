using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs;
using backend.Interfaces;
using backend.Models;
using Microsoft.EntityFrameworkCore;
using backend.Models;
using NuGet.Protocol;

namespace backend.Repository
{
    public class OrderRepository : IOrderRepository
    {
        private readonly ApplicationDbContext _context;

        public OrderRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public Task<Order> CreateOrderAsync(OrderDTO order)
        {
            throw new NotImplementedException();
        }


        public async Task<IEnumerable<OrderDTO>?> GetAllOrdersAsync() 
        {
            var orderDTOs = await _context.
            .Include(x => x.OrderDetails)
            .ThenInclude(x => x.Diamond)
            .Include(x => x.OrderDetails)
            .ThenInclude(x => x.Accessory)
            .ThenInclude(x => x.AccessoryType)
            .Include(x => x.OrderDetails)
            .ThenInclude(x => x.Accessory)
            .ThenInclude(x => x.AccessoryImages)
            .Include(x => x.PriceRate)
            .Include(x => x.Customer)
            .Include(x => x.SaleStaff)
            .Include(x => x.DeliveryStaff)
            .Include(x => x.Promotion)
            .Include(x => x.OrderDetails)
            .ThenInclude(x => x.DiamondPrice)
            .Include(x => x.OrderDetails)
            .ThenInclude(x => x.MaterialPrice)
            .ToListAsync();
    
            
            return orders;
        }

        public Task<Order> GetOrderByIdAsync(long id)
        {
            throw new NotImplementedException();
        }

        public Task<Order> UpdateOrderAsync(OrderDTO order)
        {
            throw new NotImplementedException();
        }
    }
}