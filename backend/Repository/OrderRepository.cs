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
using backend.DTOs.Order;
using backend.Mappers;
using backend.Helper;

namespace backend.Repository
{
    public class OrderRepository : IOrderRepository
    {
        private readonly ApplicationDbContext _context;

        public OrderRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        // public Task<Order> CreateOrderDetailAsync(OrderDTO order)
        // {
        //     var 
        // }
        public Task<Order> CreateOrderAsync(OrderDTO order)
        {
            throw new NotImplementedException();
        }


        public async Task<OrderResult?> GetAllOrdersAsync(OrderQuery query)
{
    var orderQueries = _context.Orders
        .Include(x => x.OrderDetails)
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
        .AsQueryable();


    // Apply filters
    if (query.OrderStatus != null)
    {
        orderQueries = orderQueries.Where(x => x.OrderStatus == query.OrderStatus);
    }

    if (!string.IsNullOrEmpty(query.ShippingAddress))
    {
        orderQueries = orderQueries.Where(x => x.ShippingAddress.ToLower() == query.ShippingAddress.ToLower());
    }

    if (query.CustomerId > 0)
    {
        orderQueries = orderQueries.Where(x => x.CustomerId == query.CustomerId);
    }

    if (query.SaleStaffId > 0)
    {
        orderQueries = orderQueries.Where(x => x.SaleStaffId == query.SaleStaffId);
    }

    if (query.DeliveryStaffId > 0)
    {
        orderQueries = orderQueries.Where(x => x.DeliveryStaffId == query.DeliveryStaffId);
    }

    if (query.MinTotalPrice != 0 || query.MaxTotalPrice != 1000000000)
    {
        orderQueries = orderQueries.Where(x => x.TotalPrice >= query.MinTotalPrice && x.TotalPrice <= query.MaxTotalPrice);
    }

    //Chua dung lam, nhung lam tam tam. Nho sua lai rang buoc max > min 
    if (query.MinDate != null)
    {
        orderQueries = orderQueries.Where(x => x.CreatedAt >= query.MinDate);
    }

    if (query.MaxDate != null)
    {
        orderQueries = orderQueries.Where(x => x.CreatedAt <= query.MaxDate);
    }

    var totalCount = await orderQueries.CountAsync();

    var totalPages = (int)Math.Ceiling((double)totalCount / query.PageSize);
    var orderDTOs = await orderQueries
        .Skip((query.PageNumber - 1) * query.PageSize)
        .Take(query.PageSize)
        .Select(x => x.ToOrderDTO())
        .ToListAsync();

    Console.WriteLine("Orders Retrieved: " + orderDTOs.Count);

    return new OrderResult
    {
        Orders = orderDTOs,
        TotalCount = totalCount,
        PageSize = query.PageSize,
        CurrentPage = query.PageNumber,
        TotalPages = totalPages
    };
}


        public async Task<Order?> GetOrderByIdAsync(long id)
        {
            //chua biet chuyen qua dto the nao :v
            return await _context.Orders
                .Include(x => x.OrderDetails)
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
                .FirstOrDefaultAsync(x => x.OrderId == id);
        }

        public Task<Order> UpdateOrderAsync(OrderDTO order)
        {
            throw new NotImplementedException();
        }
    }
}
