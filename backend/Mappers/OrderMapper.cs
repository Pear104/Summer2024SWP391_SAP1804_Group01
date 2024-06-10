using backend.DTOs;
using backend.Enums;
using backend.Models;

namespace backend.Mappers
{
    public static class OrderMapper
    {
        public static Order ToOrderFromUpdate(this UpdateOrderDTO order)
        {
            return new Order
            {
                OrderStatus = (OrderStatus)Enum.Parse(typeof(OrderStatus), order.OrderStatus),
                SaleStaffId = order.SaleStaffId,
                DeliveryStaffId = order.DeliveryStaffId
            };
        }

        public static OrderDetail ToOrderDetailFromCreate(this CreateOrderDetailDTO order)
        {
            return new OrderDetail
            {
                Size = order.Size,
                DiamondId = order.DiamondId,
                AccessoryId = order.AccessoryId,
            };
        }

        public static OrderDTO ToOrderDTO(this Order order)
        {
            return new OrderDTO
            {
                OrderId = order.OrderId,
                TotalPrice = order.TotalPrice,
                OrderStatus = order.OrderStatus.ToString(),
                ShippingAddress = order.ShippingAddress,
                CreatedAt = order.CreatedAt,
                CustomerId = order.CustomerId,
                CustomerName = order.Customer.Name,
                SaleStaffId = order.SaleStaffId,
                SaleStaffName = order.SaleStaff?.Name,
                DeliveryStaffId = order.DeliveryStaffId,
                DeliveryStaffName = order.DeliveryStaff?.Name,
                PhoneNumber = order.PhoneNumber,
                Promotion = order.Promotion,
                OrderDetails = order.OrderDetails.Select(o => o.ToOrderDetailDTO()).ToList()
            };
        }
    }
}
