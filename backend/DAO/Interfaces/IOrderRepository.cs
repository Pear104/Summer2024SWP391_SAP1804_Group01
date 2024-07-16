using System.Threading.Tasks;
using backend.DTOs;
using backend.DTOs.Order;
using backend.Services.Helper;
using backend.Models;

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
