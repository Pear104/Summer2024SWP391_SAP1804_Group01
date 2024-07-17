using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Helpers.DTOs.OrderDetail;
using Helpers.DTOs.PriceRate;
using Helpers.DTOs.Promotion;

namespace Helpers.DTOs.Order
{
    public class OrderDTO
    {
        public string? OrderId { get; set; }
        public List<OrderDetailDTO>? OrderDetails { get; set; }
        public PriceRateDTO? PriceRate { get; set; }
        public double TotalPrice { get; set; }
        public float TotalDiscountPercent { get; set; }
        public string OrderStatus { get; set; } = string.Empty;
        public string ShippingAddress { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public long CustomerId { get; set; }
        public string? CustomerName { get; set; } = string.Empty;
        public long? SaleStaffId { get; set; }
        public string? SaleStaffName { get; set; } = string.Empty;
        public long? DeliveryStaffId { get; set; }
        public string PhoneNumber { get; set; } = string.Empty;
        public string? DeliveryStaffName { get; set; } = string.Empty;
        public PromotionDTO? Promotion { get; set; }
        // public List<TransactionDTO> Transactions { get; set; }
        // public List<FeedbackDTO> Feedbacks { get; set; }
    }
}
