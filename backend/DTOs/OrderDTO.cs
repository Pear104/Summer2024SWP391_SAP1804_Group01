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
        public string ContactStatus { get; set; }
        public string ConfirmStatus { get; set; }
        public string DeliveryStatus { get; set; }
        public string OrderStatus { get; set; }
        public string ShippingAddress { get; set; }
        public DateTime CreatedAt { get; set; }
        public long CustomerId { get; set; }
        public long SaleStaffId { get; set; }
        public long DeliveryStaffId { get; set; }
        public long? PromotionId { get; set; }
        public List<OrderDetailDTO> OrderDetails { get; set; }
        // public List<TransactionDTO> Transactions { get; set; }
        // public List<FeedbackDTO> Feedbacks { get; set; }
    }
}