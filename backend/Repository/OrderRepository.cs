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


        public async Task<IEnumerable<Order>?> GetAllOrdersAsync() 
        {
            var orders = await _context.Orders
            .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Diamond)
            .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Accessory)
                .ThenInclude(x => x.AccessoryType)
            .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Accessory)
                .ThenInclude(x => x.AccessoryImages)
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