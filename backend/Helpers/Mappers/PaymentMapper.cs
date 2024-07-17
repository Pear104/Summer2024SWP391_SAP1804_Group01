
using backend.Payment_src.core.Payment.Application.Features.Commands;
using backend.Payment_src.core.Payment.Application.Features.Payment.Dtos;
using BusinessObjects.Models.Payment.Domain.Entities;

namespace Helpers.Mappers
{
    public static class PaymentMapper
    {
        public static Payment FromCreatePaymentToPayment(this CreatePayment createPayment)
        {
            var payment = new Payment()
            {
                PaymentContent = createPayment.PaymentContent!,
                PaymentCurrency = createPayment.PaymentCurrency!,
                PaymentRefId = createPayment.PaymentRefId!,
                RequiredAmount = createPayment.RequiredAmount,
                PaymentDate = createPayment.PaymentDate,
                ExpireDate = createPayment.ExpireDate,
                PaymentLanguage = createPayment.PaymentLanguage,
                MerchantId = createPayment.MerchantId,
                PaymentDestinationId = createPayment.PaymentDestinationId
            };
            return payment;
        }

        public static PaymentDtos FromPaymentToPaymentDtos(this Payment paymentModel)
        {
            var paymentDtos = new PaymentDtos()
            {
                Id = paymentModel.Id,
                PaymentContent = paymentModel.PaymentContent,
                PaymentCurrency = paymentModel.PaymentCurrency,
                PaymentRefId = paymentModel.PaymentRefId,
                RequiredAmount = paymentModel.RequiredAmount,
                PaymentDate = paymentModel.PaymentDate,
                ExpireDate = paymentModel.ExpireDate,
                PaymentLanguage = paymentModel.PaymentLanguage,
                MerchantId = paymentModel.MerchantId,
                PaymentDestinationId = paymentModel.PaymentDestinationId,
                PaidAmount = paymentModel.PaidAmount
            };
            return paymentDtos;
        }
    }
}
