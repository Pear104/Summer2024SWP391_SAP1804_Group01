namespace Helpers.Queries
{
    public class PromotionQuery
    {
        public long PromotionId { get; set; }
        public string? PromotionName { get; set; }
        public string PromotionCode { get; set; } = string.Empty;
        public string? SearchPromotion { get; set; } = string.Empty;
        public float DiscountPercent { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public int PageSize { get; set; } = 10;
        public int PageNumber { get; set; } = 1;
    }
}
