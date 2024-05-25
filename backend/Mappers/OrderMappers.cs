using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs;
using backend.Models;

namespace backend.Mappers
{
    public static class OrderMappers
    {
        public static UpdateOrderDTO ToOrderUpdate(this Order order) 
        { 
            return new UpdateOrderDTO
            {
                ConfirmStatus = order.ConfirmStatus,
                OrderStatus = order.OrderStatus,
                ContactStatus = order.ContactStatus,
                DeliveryStatus = order.DeliveryStatus

            };
        }
        public static Order ToOrderFromUpdate(this UpdateOrderDTO order) 
        { 
            return new Order
            {
                ConfirmStatus = order.ConfirmStatus,
                OrderStatus = order.OrderStatus,
                ContactStatus = order.ContactStatus,
                DeliveryStatus = order.DeliveryStatus
            };
        }
        public static OrderDTO ToOrderDTO(this Order order) 
        { 
            return new OrderDTO
            {
                OrderId= order.OrderId,
                TotalPrice = order.TotalPrice,
                TotalDiscountPercent= order.TotalDiscountPercent,
                ContactStatus = order.ContactStatus,
                ConfirmStatus = order.ConfirmStatus,
                DeliveryStatus = order.DeliveryStatus,
                OrderStatus = order.OrderStatus,
                ShippingAddress = order.ShippingAddress,
                CreatedAt = order.CreatedAt,
                CustomerId = order.CustomerId,
                SaleStaffId = order.SaleStaffId,
                DeliveryStaffId = order.DeliveryStaffId,
                PromotionId = order.PromotionId,
                OrderDetails= order.OrderDetails.Select(o => o.ToOrderDetailDTO()).ToList()
            };
        }
    }
}