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
using backend.Helper;
using Microsoft.AspNetCore.Http.HttpResults;
using backend.Enums;

namespace backend.Repository
{
    public class OrderRepository : IOrderRepository
    {
        private readonly ApplicationDbContext _context;

        public OrderRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<Order?> CreateOrderAsync(CreateOrderDTO order)
        {
            var createdAt = _context.Orders.FirstOrDefault(x => x.CreatedAt == order.CreatedAt);
            var TotalPrice = _context.Orders.FirstOrDefault(x => x.TotalPrice == order.TotalPrice);
            var TotalDiscountPercent = _context.Orders.FirstOrDefault(x => x.TotalDiscountPercent == order.TotalDiscountPercent);
            var OrderStatus = _context.Orders.FirstOrDefault(x => x.OrderStatus.ToString() == order.OrderStatus);
            var ShippingAddress = _context.Orders.FirstOrDefault(x => x.ShippingAddress == order.ShippingAddress);
            var Customer = await _context.Accounts.FindAsync(order.CustomerId);
            var SaleStaff = await _context.Accounts.FindAsync(order.SaleStaffId);
            var DeliveryStaff = await _context.Accounts.FindAsync(order.DeliveryStaffId);
            foreach(var orderDetail in order.OrderDetails)
            {
                var diamond = _context.Diamonds.FirstOrDefault(x => x.DiamondId == orderDetail.DiamondId);
                var accessory = _context.Accessories.FirstOrDefault(x => x.AccessoryId == orderDetail.AccessoryId);
                var materialPrice = _context.MaterialPrices.FirstOrDefault(x => x.MaterialPriceId == orderDetail.MaterialPriceId);
                var diamondPrice = _context.DiamondPrices.FirstOrDefault(x => x.DiamondPriceId == orderDetail.DiamondPriceId);
                if(diamond != null && materialPrice != null && diamondPrice != null)
                {
                    var orderDetailFromCreate = orderDetail.ToOrderDetailFromCreate();
                    orderDetailFromCreate.Accessory = accessory;
                    orderDetailFromCreate.Diamond = diamond;
                    orderDetailFromCreate.MaterialPrice = materialPrice;
                    orderDetailFromCreate.DiamondPrice = diamondPrice;
                    await _context.OrderDetails.AddAsync(orderDetailFromCreate);
                    await _context.SaveChangesAsync();
                }
            }
            return null;
        }

        public async Task<OrderDetail?> CreateOrderDetailAsync(CreateOrderDetailDTO order)
        {
            var diamond = _context.Diamonds.FirstOrDefault(x => x.DiamondId == order.DiamondId);
            var accessory = _context.Accessories.FirstOrDefault(x => x.AccessoryId == order.AccessoryId);
            var materialPrice = _context.MaterialPrices.FirstOrDefault(x => x.MaterialPriceId == order.MaterialPriceId);
            var diamondPrice = _context.DiamondPrices.FirstOrDefault(x => x.DiamondPriceId == order.DiamondPriceId);
            if(diamond != null && materialPrice != null && diamondPrice != null)
            {
                var orderDetail = order.ToOrderDetailFromCreate();
                orderDetail.Accessory = accessory;
                orderDetail.Diamond = diamond;
                orderDetail.MaterialPrice = materialPrice;
                orderDetail.DiamondPrice = diamondPrice;
                await _context.OrderDetails.AddAsync(orderDetail);
                await _context.SaveChangesAsync();
            }
            return null;
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


        public async Task<OrderDTO?> GetOrderByIdAsync(long id)
        {
            var order = await _context.Orders
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Diamond)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Accessory)
                .ThenInclude(x => x.AccessoryType)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Accessory)
                .ThenInclude(x => x.AccessoryImages)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Accessory)
                .ThenInclude(x => x.Shape)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.MaterialPrice)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.DiamondPrice)
                .Include(x => x.SaleStaff)
                .Include(x => x.DeliveryStaff)
                .FirstOrDefaultAsync(x => x.OrderId == id);

            var orderDTO = order?.ToOrderDTO();

            if(orderDTO == null)
            {
                return null;
            }

            return orderDTO;
        }

        public async Task<Order?> UpdateOrderAsync(long id, UpdateOrderDTO order)
        {
            var existedOrder = _context.Orders.FirstOrDefault(x => x.OrderId == id);
            if(existedOrder == null)
            {
                return null;
            }
            existedOrder.OrderStatus = Enum.Parse<OrderStatus>(order.OrderStatus);
            _context.Entry(existedOrder).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existedOrder;
        }
    }
}
