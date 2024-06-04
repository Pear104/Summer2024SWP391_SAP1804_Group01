using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs.Order
{
    public class OrderListResult
    {
        public List<OrderDTO> Orders { get; set; } = new List<OrderDTO>();
        public double TotalPrice { get; set; }
        public float TotalDiscountPercent { get; set; }
        public string OrderStatus { get; set; } = string.Empty;
        public string ShippingAddress { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public long CustomerId { get; set; }
        public long SaleStaffId { get; set; }
        public long DeliveryStaffId { get; set; }
        public long? PromotionId { get; set; }
        // public int TotalPages { get; set; }
        // public int PageSize { get; set; }
        // public int CurrentPage { get; set; }
        // public int TotalCount { get; set; }
    }
}