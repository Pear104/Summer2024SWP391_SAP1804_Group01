using backend.Data;
using backend.Interfaces;
using backend.Models.Payment.Domain.Entities;
using backend.Payment_src.core.Payment.Application.Base.Models;
using backend.Payment_src.core.Payment.Application.Features.Commands;
using backend.Payment_src.core.Payment.Application.Features.Payment.Dtos;
using backend.Payment_src.core.Payment.Service.Momo.Config;
using backend.Payment_src.core.Payment.Service.Momo.Request;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

namespace backend.Repository
{
    public class PaymentRepository : IPaymentRepository
    {
        private readonly ApplicationDbContext _dbContext;
        private readonly MomoConfig _momoConfig;

        public PaymentRepository(ApplicationDbContext dbContext, IOptions<MomoConfig> momoConfig)
        {
            _dbContext = dbContext;
            _momoConfig = momoConfig.Value;
        }
        public async Task<Payment> CreatePayment(Payment payment)
        {
            await _dbContext.AddAsync(payment);
            await _dbContext.SaveChangesAsync();
            return payment;
        }
        public async Task<BaseResultWithData<(PaymentReturnDtos, string)>> ProcessMomoPaymentReturn(MomoOneTimePaymentResultRequest resultRequest)
        {
            string returnurl = string.Empty;
            var result = new BaseResultWithData<(PaymentReturnDtos, string)>();
            //try catch??
            var resultData = new PaymentReturnDtos();
            var isValidSignature = resultRequest.IsValidSignature(_momoConfig.AccessKey, _momoConfig.SecretKey);

            if (isValidSignature)
            {
                //?!?!??!?! why search by paymentModel.Id and response.order ID??????
                //edit: chang to paymentModel.PaymentRefId and result.orderId => Both refer to Store's order
                var paymentModel = await _dbContext.Payments.FirstOrDefaultAsync(p => p.PaymentRefId.ToLower().Equals(resultRequest.orderId!.ToLower()));

                if (paymentModel != null)
                {
                    //resultRequest for an existing order => redirect to the store that made that order
                    var merchant = await _dbContext.Merchants.FirstOrDefaultAsync(m => m.Id.ToLower().Equals(paymentModel.MerchantId!.ToLower()));
                    returnurl = merchant?.MerchantReturnUrl ?? string.Empty;

                    if (resultRequest.resultCode == 0)
                    {
                        resultData.PaymentStatus = "00";
                        resultData.PaymentId = paymentModel.Id;
                        //TODO: Make signature
                        resultData.Signature = Guid.NewGuid().ToString();
                    }
                    else
                    {
                        resultData.PaymentStatus = "10";
                        resultData.PaymentMessage = "Payment process failed";
                    }

                    result.Success = true;
                    result.Message = "Ok()";
                    result.Data = (resultData, returnurl);  //don't know what this do, WILL BE REFACTORED
                }//end payment is NOT null
                else
                {
                    resultData.PaymentStatus = "11";
                    resultData.PaymentMessage = "Can't find payment at payment service";
                }//end payment is null
            }//end sinature is valid
            else
            {
                resultData.PaymentStatus = "99";
                resultData.PaymentMessage = "Invalid signature in response";
            }//end sinature is NOT valid
            return await Task.FromResult(result);
        }//end ProcessMomoPaymentReturn

        public async Task<List<Payment>> GetAllPayment()
        {
            var payments = await _dbContext.Payments.ToListAsync();
            return payments;
        }

        public async Task<Payment>? GetPaymentById(string id)
        {
            var payment = await _dbContext.Payments.FirstOrDefaultAsync(p => p.Id.ToLower().Equals(id.ToLower()));
            return payment;
        }

    }
}
