using backend.Payment_src.core.Payment.Application.Base.Models;
using backend.Payment_src.core.Payment.Application.Features.Payment.Dtos;
using backend.Payment_src.core.Payment.Service.Vnpay.Config;
using backend.Payment_src.core.Payment.Service.Vnpay.Response;
using BusinessObjects.Enums;
using BusinessObjects.Models.Payment.Domain.Entities;
using DAOs;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Repositories.Interfaces.Payments;

namespace Repositories.Implements
{
    public class PaymentRepository : IPaymentRepository
    {
        private readonly ApplicationDbContext _dbContext;

        //private readonly PaymentTransactionRepository _transactionRepository;

        private readonly VnpayConfig _vnpayConfig;

        private readonly IConfiguration _config;

        public PaymentRepository(
            ApplicationDbContext dbContext,
            //PaymentTransactionRepository transactionRepository,
            IOptions<VnpayConfig> vnpayConfig,IConfiguration config
        )
        {
            _dbContext = dbContext;
            //_transactionRepository = transactionRepository;
            _vnpayConfig = vnpayConfig.Value;
            _config = config;

        }

        public async Task<Payment> CreatePayment(Payment payment)
        {
            await _dbContext.AddAsync(payment);
            await _dbContext.SaveChangesAsync();
            return payment;
        }

        public async Task<Payment> UpdatePayment(Payment payment)
        {
            var existingPayment = await _dbContext.Payments.FirstOrDefaultAsync(p =>
                p.Id.ToLower().Equals(payment.Id.ToLower())
            );
            if (existingPayment == null)
            {
                return null;
            }
            existingPayment = payment;
            await _dbContext.SaveChangesAsync();
            return existingPayment;
        }

        public async Task<
            BaseResultWithData<(PaymentReturnDtos, string)>
        > ProcessVnpayPaymentResponse(VnpayPayResponse request)
        {
            string returnUrl = string.Empty;
            var result = new BaseResultWithData<(PaymentReturnDtos, string)>();
            //try catch??
            var resultData = new PaymentReturnDtos();
            var isValidSignature = request.IsValidSignature(_vnpayConfig.HashSecret);

            if (isValidSignature)
            {
                //?!?!??!?! why search by paymentModel.Id and response.order ID??????
                //edit: chang to paymentModel.PaymentRefId and result.orderId => Both refer to Store's order
                var paymentModel = await _dbContext.Payments.FirstOrDefaultAsync(p =>
                    p.PaymentRefId.ToLower().Equals(request.vnp_TxnRef!.ToLower())
                );

                if (paymentModel != null)
                {
                    //resultRequest for an existing order => redirect to the store that made that order
                    var merchant = await _dbContext.Merchants.FirstOrDefaultAsync(m =>
                        m.Id.ToLower().Equals(paymentModel.MerchantId!.ToLower())
                    );

                    // returnUrl = merchant?.MerchantReturnUrl ?? string.Empty;
                    returnUrl = $"{_config["ClientUrl"]}/account/order-history";
                } //end payment is NOT null
                else
                {
                    resultData.PaymentStatus = "11";
                    resultData.PaymentMessage = "Can't find payment at payment service";
                } //end payment is null

                if (request.vnp_ResponseCode == "00")
                {
                    resultData.PaymentStatus = "00";
                    // Update the transaction status in the db
                    var transaction = await _dbContext.Transactions.FirstOrDefaultAsync(o =>
                        o.TransactionId == paymentModel.PaymentRefId
                    );
                    transaction!.TransactionStatus = TransactionStatus.Completed;
                    _dbContext.Entry(transaction).State = EntityState.Modified;
                    var order = await _dbContext.Orders.FirstOrDefaultAsync(o =>
                        o.OrderId == transaction.OrderId
                    );

                    order!.OrderStatus = OrderStatus.Processing;
                    _dbContext.Entry(transaction).State = EntityState.Modified;
                    _dbContext.Entry(order!).State = EntityState.Modified;
                    _dbContext.SaveChanges();
                    resultData.PaymentId = paymentModel!.Id;
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
                result.Data = (resultData, returnUrl);
            } //end sinature is valid
            else
            {
                resultData.PaymentStatus = "99";
                resultData.PaymentMessage = "Invalid signature in response";
            } //end sinature is NOT valid
            return await Task.FromResult(result);
        } //end ProcessVnpayPaymentReturn

        public async Task<BaseResultWithData<VnpayPayIpnResponse>> ProcessVnpayIpnResponse(
            VnpayPayResponse request
        )
        {
            string returnUrl = string.Empty;
            var result = new BaseResultWithData<VnpayPayIpnResponse>();
            //try catch??
            var resultData = new VnpayPayIpnResponse();
            var isValidSignature = request.IsValidSignature(_vnpayConfig.HashSecret);

            if (isValidSignature)
            {
                //?!?!??!?! why search by paymentModel.Id and response.order ID??????
                //edit: chang to paymentModel.PaymentRefId and result.orderId => Both refer to Store's order
                var paymentModel = await _dbContext.Payments.FirstOrDefaultAsync(p =>
                    p.PaymentRefId.ToLower().Equals(request.vnp_TxnRef!.ToLower())
                );

                if (paymentModel != null)
                {
                    if (paymentModel.RequiredAmount == request.vnp_Amount / 100)
                    {
                        if (paymentModel.PaymentStatus != "0")
                        {
                            string message = "";
                            string status = "";

                            if (
                                request.vnp_ResponseCode == "00"
                                && request.vnp_TransactionStatus == "00"
                            )
                            {
                                status = "0";
                                message = "Tran success";
                            }
                            else
                            {
                                status = "-1";
                                message = "Tran error";
                            }

                            /*!!!TECHNICAL DEPT!!!
                             * Should not call PaymentTransaction repo here
                             * This entire function should be put in a PaymentService Class
                             */

                            //TODO: update database
                            //insert transaction, update payment
                            var paymentTransaction = new PaymentTransaction()
                            {
                                Id = DateTime.Now.Ticks.ToString(),
                                TransMessage = message,
                                TranPayload = JsonConvert.SerializeObject(request),
                                TranStatus = status,
                                TranAmount = request.vnp_Amount,
                                TranDate = DateTime.Now,
                                PaymentId = request.vnp_TxnRef,
                                //TranRefId = CurrentUserService.AccountId
                            };

                            //paymentTransaction = await _transactionRepository.CreateTransaction(paymentTransaction);
                            if (paymentTransaction != null)
                            {
                                //var transactions = await _transactionRepository.GetAllTransactionsByPaymentId(paymentModel.Id);
                                //paymentModel.PaidAmount = transactions.Sum(t => t.TranAmount).ToString();
                                //paymentModel.PaymentLastMessage = paymentTransaction.TransMessage;
                                //paymentModel.PaymentStatus = paymentTransaction.TranStatus;
                                ////paymentModel.LastUpdateAt = paymentTransaction.TranDate
                                ////paymentModel.LastUpdateBy= paymentTransaction.TranDate

                                var updateResult = await UpdatePayment(paymentModel); //AHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
                                if (updateResult != null)
                                {
                                    resultData.Set("00", "Confirm success");
                                    result.Success = true;
                                }
                                else
                                {
                                    resultData.Set("99", "Input required data");
                                }
                            } //end paymentTransation is null
                            //TODO: Confirm success
                        } //end paymentStatus is valid
                        else
                        {
                            resultData.Set("02", "Order already confirmed");
                        } //end paymentStatus is NOT valid
                    } //end payment amount is valid
                    else
                    {
                        resultData.Set("04", "Invalid amount");
                    } //end payment amount is NOT valid
                } //end payment is NOT null
                else
                {
                    resultData.Set("01", "Order not found");
                } //end payment is null
            } //end sinature is valid
            else
            {
                resultData.Set("97", "Invalid signature");
            } //end sinature is NOT valid
            result.Data = resultData;
            return await Task.FromResult(result);
        } //end ProcessVnpayPaymentReturn

        public async Task<List<Payment>> GetAllPayment()
        {
            var payments = await _dbContext.Payments.ToListAsync();
            return payments;
        }

        public async Task<Payment>? GetPaymentById(string id)
        {
            var payment = await _dbContext.Payments.FirstOrDefaultAsync(p =>
                p.Id.ToLower().Equals(id.ToLower())
            );
            return payment!;
        }

        public Task<BaseResult> ProcessMomoPaymentIpn()
        {
            throw new NotImplementedException();
        }
        //public Task<BaseResultWithData<VnpayPayResponse>> ProcessVnpayPaymentIpn()
        //{
        //    //var result = new BaseResultWithData<VnpayPayIpnResponse>();
        //    //var resultData = new VnpayPayIpnResponse();

        //    //var isValidSignature = response.IsValidSignature(_vnpayConfig.HashSecret);
        //    throw new NotImplementedException();
        //}
    }
}
