using backend.BusinessOjects.Models.Payment.Domain.Entities;

namespace backend.Interfaces
{
    public interface IPaymentSignatureRepository
    {
        public Task<PaymentSignature>? CreateSigniture(PaymentSignature paymentSignature);
    }
}
