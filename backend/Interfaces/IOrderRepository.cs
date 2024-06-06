using System.Collections.Generic;
using System.Threading.Tasks;
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
        Task<OrderDetail?> CreateOrderDetailAsync(CreateOrderDetailDTO order);
        Task<Order> CreateOrderAsync(CreateOrderDTO order);
        Task<Order> UpdateOrderAsync(OrderDTO order);
        
    }
}