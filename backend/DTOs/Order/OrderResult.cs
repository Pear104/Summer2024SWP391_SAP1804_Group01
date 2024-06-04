using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Models;

namespace backend.DTOs.Order
{
    public class OrderResult
    {
        public long OrderId { get; set; }
        public List<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
        public float TotalDiscountPercent { get; set; }
        public string OrderStatus { get; set; } = string.Empty;
        public string ShippingAddress { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public long CustomerId { get; set; }
        public long SaleStaffId { get; set; }
        public long DeliveryStaffId { get; set; }
        public Promotion? Promotion { get; set; }

        // public List<Feedback> Feedbacks { get; set; } = new List<Feedback>();
    }
}