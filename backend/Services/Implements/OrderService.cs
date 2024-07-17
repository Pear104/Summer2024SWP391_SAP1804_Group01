using BusinessObjects.Models;
using Helpers.DTOs.Order;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class OrderService : IOrderService
    {
        private readonly IOrderRepository _orderRepository;

        public OrderService(IOrderRepository orderRepository)
        {
            _orderRepository = orderRepository;
        }

        public Task<Order?> CompleteOrder(string id)
        {
            return _orderRepository.CompleteOrderAsync(id);
        }

        public Task<Order?> CreateOrder(long customerId, CreateOrderDTO orderDto)
        {
            return _orderRepository.CreateOrderAsync(customerId, orderDto);
        }

        public Task<Order?> CreateOrderPaypal(long customerId, CreateOrderDTO orderDto)
        {
            return _orderRepository.CreateOrderPaypalAsync(customerId, orderDto);
        }

        public Task<OrderResult?> GetAllOrders(OrderQuery query)
        {
            return _orderRepository.GetAllOrdersAsync(query);
        }

        public Task<Order?> GetOrderById(string id)
        {
            return _orderRepository.GetOrderByIdAsync(id);
        }

        public Task<Order?> UpdateOrder(string id, UpdateOrderDTO orderDto)
        {
            return _orderRepository.UpdateOrderAsync(id, orderDto);
        }
    }
}
