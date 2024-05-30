namespace backend.Models.Payment.Domain.Entities
{
    public class PaymentTransaction
    {
        public string Id { get; set; }
        public string TransMessage { get; set; } = string.Empty;
        public string TranPayload { get; set; } = string.Empty;
        public string TranStatuc { get; set; } = string.Empty;
        public decimal? ranAmount { get; set; }
        public DateTime? TranDate { get; set; }
        public string? PaymentId { get; set; } = string.Empty;
        public string? TranRefId { get; set; } = string.Empty;


    }
}
