using backend.Payment_src.core.Payment.Application.Base.Models;
using backend.Payment_src.core.Payment.Application.Features.Payment.Dtos;
// using backend.Payment_src.core.Payment.Service.Momo.Request;
using backend.Payment_src.core.Payment.Service.Vnpay.Response;
using BusinessObjects.Models.Payment.Domain.Entities;

namespace Repositories.Interfaces.Payments
{
    public interface IPaymentRepository
    {
        public Task<Payment>? CreatePayment(Payment payment);
        public Task<Payment>? UpdatePayment(Payment payment);
        public Task<List<Payment>> GetAllPayment();
        public Task<Payment>? GetPaymentById(string id);

        // public Task<BaseResultWithData<(PaymentReturnDtos, string)>> ProcessMomoPaymentReturn(MomoOneTimePaymentResultRequest resultRequest);
        // public Task<BaseResult> ProcessMomoPaymentIpn();
        public Task<BaseResultWithData<(PaymentReturnDtos, string)>> ProcessVnpayPaymentResponse(
            VnpayPayResponse request
        );
        public Task<BaseResultWithData<VnpayPayIpnResponse>> ProcessVnpayIpnResponse(
            VnpayPayResponse request
        );
    }
}
