
using BusinessObjects.Enums;

namespace Helpers.Queries
{
    public class OrderQuery
    {
        public OrderStatus? OrderStatus { get; set; } = null;
        public string? ShippingAddress { get; set; } = string.Empty;
        public long? CustomerId { get; set; }
        public long? SaleStaffId { get; set; }
        public long? DeliveryStaffId { get; set; }
        public DateTime? MinDate { get; set; } = null;
        public DateTime? MaxDate { get; set; } = null;
        public string PhoneNumber { get; set; } = string.Empty;
        public string? SearchCustomerName { get; set; } = string.Empty;
        public double? MinTotalPrice { get; set; } = 0;
        public double? MaxTotalPrice { get; set; } = 1000000000;
        public int PageSize { get; set; } = 5;
        public int PageNumber { get; set; } = 1;
    }
}
