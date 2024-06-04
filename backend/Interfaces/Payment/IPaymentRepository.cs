using backend.Models.Payment.Domain.Entities;
using backend.Payment_src.core.Payment.Application.Base.Models;
using backend.Payment_src.core.Payment.Application.Features.Commands;
using backend.Payment_src.core.Payment.Application.Features.Payment.Dtos;
using backend.Payment_src.core.Payment.Service.Momo.Request;

namespace backend.Interfaces
{
    public interface IPaymentRepository
    {
        public Task<Payment>? CreatePayment(Payment payment);
        public Task<List<Payment>> GetAllPayment();
        public Task<Payment>? GetPaymentById(string id);
        public Task<BaseResultWithData<(PaymentReturnDtos, string)>> ProcessMomoPaymentReturn(MomoOneTimePaymentResultRequest resultRequest);
    }
}
