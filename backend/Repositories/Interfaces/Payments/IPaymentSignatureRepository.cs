using BusinessObjects.Models.Payment.Domain.Entities;

namespace Repositories.Interfaces.Payments
{
    public interface IPaymentSignatureRepository
    {
        public Task<PaymentSignature>? CreateSigniture(PaymentSignature paymentSignature);
    }
}
