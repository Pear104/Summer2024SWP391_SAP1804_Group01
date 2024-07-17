

namespace backend.Payment_src.core.Payment.Application.Features.Commands
{
    public class CreatePayment
    {
        public string? PaymentContent { get; set; } = string.Empty;

        public string? PaymentCurrency { get; set; } = string.Empty;

        public string? PaymentRefId { get; set; } = string.Empty;

        public decimal? RequiredAmount { get; set; }

        public DateTime PaymentDate { get; set; } = DateTime.Now;

        public DateTime ExpireDate { get; set; } = DateTime.Now.AddMinutes(15);

        public string? PaymentLanguage { get; set; } = string.Empty;

        public string? MerchantId { get; set; } = string.Empty;
        public string? PaymentDestinationId { get; set; } = string.Empty;
        public string? Signature { get; set; } = string.Empty;
    }
}
