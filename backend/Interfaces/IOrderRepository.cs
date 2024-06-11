using backend.DTOs;
using backend.DTOs.Order;
using backend.Helper;
using backend.Models;

namespace backend.Interfaces
{
    public interface IOrderRepository
    {
        Task<OrderResult?> GetAllOrdersAsync(OrderQuery query);
        Task<OrderDTO?> GetOrderByIdAsync(long id);
        Task<Order?> CreateOrderAsync(long customerId, CreateOrderDTO orderDto);
        Task<Order?> UpdateOrderAsync(long id, UpdateOrderDTO orderDto);
    }
}
