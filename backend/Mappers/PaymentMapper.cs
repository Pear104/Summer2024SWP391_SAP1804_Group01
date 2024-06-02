using backend.Models.Payment.Domain.Entities;
using backend.Payment_src.core.Payment.Application.Features.Commands;

namespace backend.Mappers
{
    public static class PaymentMapper
    {
        public static Payment FromCreatePaymentToPayment(this CreatePayment createPayment)
        {
            var payment = new Payment()
            {
                PaymentContent = createPayment.PaymentContent,
                PaymentCurrency = createPayment.PaymentCurrency,
                PaymentRefId = createPayment.PaymentRefId,
                RequiredAmount = createPayment.RequiredAmount,
                PaymentDate = createPayment.PaymentDate,
                ExpireDate = createPayment.ExpireDate,
                PaymentLanguage = createPayment.PaymentLanguage,
                MerchantId = createPayment.MerchantId,
                PaymentDestinationId = createPayment.PaymentDestinationId
            };
            return payment;
        }
    }
}
