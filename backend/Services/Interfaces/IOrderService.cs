using BusinessObjects.Models;
using Helpers.DTOs.Order;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface IOrderService
    {
        Task<OrderResult?> GetAllOrders(OrderQuery query);
        Task<Order?> GetOrderById(string id);
        Task<Order?> CreateOrder(long customerId, CreateOrderDTO orderDto);
        Task<Order?> CreateOrderPaypal(long customerId, CreateOrderDTO orderDto);
        Task<Order?> UpdateOrder(string id, UpdateOrderDTO orderDto);
        Task<Order?> CompleteOrder(string id);
    }
}
