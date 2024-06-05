using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs;
using backend.DTOs.Order;
using backend.Interfaces;
using backend.Mappers;
using backend.Models;
using Microsoft.EntityFrameworkCore;
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

        public async Task<OrderResult?> GetAllOrdersAsync()
        {
            var orderDTOs = await _context
                .Orders.Include(x => x.OrderDetails)
                .ThenInclude(x => x.Diamond)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Accessory)
                .ThenInclude(x => x.AccessoryType)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Accessory)
                .ThenInclude(x => x.AccessoryImages)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.MaterialPrice)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.DiamondPrice)
                .Include(x => x.SaleStaff)
                .Include(x => x.DeliveryStaff)
                .Select(x => x.ToOrderDTO())
                .ToListAsync();

            return new OrderResult
            {
                Orders = orderDTOs,
                TotalCount = 1,
                PageSize = 1,
                CurrentPage = 1,
                TotalPages = 1
            };
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
