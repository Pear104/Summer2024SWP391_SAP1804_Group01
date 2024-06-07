using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Models;

namespace backend.DTOs.Order
{
    public class CreateOrderDTO
    {
        public List<CreateOrderDetailDTO> OrderDetails { get; set; } = new List<CreateOrderDetailDTO>();
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public double TotalPrice { get; set; }
        public float TotalDiscountPercent { get; set; }
        public string OrderStatus { get; set; } = string.Empty;
        public string ShippingAddress { get; set; } = string.Empty;
        public long CustomerId { get; set; }
        public long SaleStaffId { get; set; }
        public long DeliveryStaffId { get; set; }
        public long PromotionId { get; set; }
    }
}