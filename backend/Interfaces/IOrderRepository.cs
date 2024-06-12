using backend.DTOs;
using backend.DTOs.Order;
using backend.Helper;
using backend.Models;

namespace backend.Interfaces
{
    public interface IOrderRepository
    {
        Task<OrderResult?> GetAllOrdersAsync(OrderQuery query);
        Task<OrderDTO?> GetOrderByIdAsync(string id);
        Task<Order?> CreateOrderAsync(long customerId, CreateOrderDTO orderDto);
        Task<Order?> UpdateOrderAsync(string id, UpdateOrderDTO orderDto);
    }
}
