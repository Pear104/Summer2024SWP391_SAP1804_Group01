using backend.BusinessOjects.Models;
using backend.Services.DTOs;
using backend.Services.DTOs.Order;
using backend.Services.QueriesHelper;

namespace backend.Interfaces
{
    public interface IOrderRepository
    {
        Task<OrderResult?> GetAllOrdersAsync(OrderQuery query);
        Task<Order?> GetOrderByIdAsync(string id);
        Task<Order?> CreateOrderAsync(long customerId, CreateOrderDTO orderDto);
        Task<Order?> CreateOrderPaypalAsync(long customerId, CreateOrderDTO orderDto);
        Task<Order?> UpdateOrderAsync(string id, UpdateOrderDTO orderDto);
        Task<Order?> CompleteOrderAsync(string id);
    }
}
