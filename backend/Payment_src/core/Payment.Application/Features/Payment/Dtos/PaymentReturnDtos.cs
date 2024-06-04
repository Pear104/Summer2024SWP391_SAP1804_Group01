namespace backend.Payment_src.core.Payment.Application.Features.Payment.Dtos
{
    public class PaymentReturnDtos
    {
        public string? PaymentId { get; set; }
        /// <summary>
        /// 00: Success
        /// 99: Unknown
        /// 10: Error
        /// </summary>
        public string? PaymentStatus { get; set; }
        public string? PaymentMessage { get; set; }
        /// <summary>
        /// Format: yyyyMMddHHmmSS
        /// </summary>
        public string? PaymentDate{ get; set; }
        public string? PaymentRefId { get; set; }
        public string? Amount { get; set; }
        public string? Signature { get; set; }

    }
}
