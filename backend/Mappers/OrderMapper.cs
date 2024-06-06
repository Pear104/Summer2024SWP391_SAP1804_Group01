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
            };
        }
        
        public static OrderDetail ToOrderDetailFromCreate(this CreateOrderDetailDTO order)
        {
            return new OrderDetail
            {
                Size = order.Size,
                DiamondId = order.DiamondId,
                AccessoryId = order.AccessoryId,
                DiamondPriceId = order.DiamondPriceId,
                MaterialPriceId = order.MaterialPriceId,
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
                SaleStaffId = order.SaleStaffId,
                SaleStaffName = order.SaleStaff.Name,
                DeliveryStaffId = order.DeliveryStaffId,
                DeliveryStaffName = order.DeliveryStaff.Name,
                Promotion = order.Promotion,
                OrderDetails = order.OrderDetails.Select(o => o.ToOrderDetailDTO()).ToList()
            };
        }
    }
}
