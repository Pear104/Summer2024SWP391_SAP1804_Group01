
using BusinessObjects.Enums;

namespace Helpers.Queries
{
    public class WarrantyRequestQuery
    {
        public long? CustomerId { get; set; }
        public string? CustomerName { get; set; } = string.Empty;
        public long? WarrantyStaffId { get; set; }
        public long? DeliveryStaffId { get; set; }
        public DateTime? ReceiveTime { get; set; }
        public DateTime? ReturnTime { get; set; }
        public WarrantyStatus? WarrantyStatus { get; set; } = null;
        public int PageSize { get; set; } = 10;
        public int PageNumber { get; set; } = 1;
    }
}
