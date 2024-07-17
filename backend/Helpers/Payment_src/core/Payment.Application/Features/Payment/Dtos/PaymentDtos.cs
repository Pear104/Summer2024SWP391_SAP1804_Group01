

namespace backend.Payment_src.core.Payment.Application.Features.Payment.Dtos
{
    public class PaymentDtos
    {

        public string Id { get; set; }

        public string? PaymentContent { get; set; } = string.Empty;

        public string? PaymentCurrency { get; set; } = string.Empty;

        public string? PaymentRefId { get; set; } = string.Empty;

        public decimal? RequiredAmount { get; set; }

        public DateTime? PaymentDate { get; set; } = DateTime.Now;

        public DateTime? ExpireDate { get; set; }

        public string? PaymentLanguage { get; set; } = string.Empty;

        public string? MerchantId { get; set; } = string.Empty;

        public string? PaymentDestinationId { get; set; } = string.Empty;

        public string? PaidAmount { get; set; } = string.Empty;

    }
}
