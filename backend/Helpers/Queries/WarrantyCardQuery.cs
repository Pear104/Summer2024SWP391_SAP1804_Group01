namespace Helpers.Queries
{
    public class WarrantyCardQuery
    {
        public long? WarrantyCardId { get; set; }
        public long? DiamondId { get; set; }
        public long? AccessoryId { get; set; }
        public string? ProductName { get; set; }
        public long? CustomerId { get; set; }
        public string? CustomerName { get; set; }
        public DateTime? MinDate { get; set; } = null;
        public DateTime? MaxDate { get; set; } = null;
        public int PageSize { get; set; } = 5;
        public int PageNumber { get; set; } = 1;
    }
}
