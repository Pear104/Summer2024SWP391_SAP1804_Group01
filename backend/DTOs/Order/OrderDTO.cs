using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs
{
    public class OrderDTO
    {
        public long OrderId { get; set; }
        public double TotalPrice { get; set; }
        public float TotalDiscountPercent { get; set; }
        public string ContactStatus { get; set; } = string.Empty;
        public string ConfirmStatus { get; set; } = string.Empty;
        public string DeliveryStatus { get; set; } = string.Empty;
        public string OrderStatus { get; set; } = string.Empty;
        public string ShippingAddress { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public long CustomerId { get; set; }
        public long SaleStaffId { get; set; }
        public long DeliveryStaffId { get; set; }
        public long? PromotionId { get; set; }
        public List<OrderDetailDTO> OrderDetails { get; set; }  = new List<OrderDetailDTO>();
        // public List<TransactionDTO> Transactions { get; set; }
        // public List<FeedbackDTO> Feedbacks { get; set; }
    }
}