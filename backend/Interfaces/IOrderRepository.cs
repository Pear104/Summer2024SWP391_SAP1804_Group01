using System.Collections.Generic;
using System.Threading.Tasks;
using backend.DTOs;
using backend.DTOs.Order;
using backend.Models;

namespace backend.Interfaces
{
    public interface IOrderRepository
    {
        Task<OrderResult?> GetAllOrdersAsync();
        Task<Order> GetOrderByIdAsync(long id);
        Task<Order> CreateOrderAsync(OrderDTO order);
        Task<Order> UpdateOrderAsync(OrderDTO order);
    }
}