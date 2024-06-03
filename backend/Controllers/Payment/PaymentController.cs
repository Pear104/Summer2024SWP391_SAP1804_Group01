using backend.Interfaces;
using backend.Mappers;
using backend.Models.Payment.Domain.Entities;
using backend.Payment_src.core.Payment.Application.Features.Commands;
using backend.Payment_src.core.Payment.Application.Features.Payment.Dtos;
using backend.Payment_src.core.Payment.Service.Momo.Config;
using backend.Payment_src.core.Payment.Service.Momo.Request;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Options;
using Microsoft.Extensions.Options;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentController : ControllerBase
    {
        private readonly IPaymentRepository _paymentRepo;
        private readonly MomoConfig _momoConfig;
        public PaymentController(IPaymentRepository paymentRepo, IOptions<MomoConfig> momoConfig)
        {
            _paymentRepo = paymentRepo;
            _momoConfig = momoConfig.Value;
        }

        [HttpGet]
        [Route("{id}")]
        [ProducesResponseType(typeof(Payment), 200)]
        [ProducesResponseType(400)]
        public async Task<IActionResult> GetById([FromRoute] string id)
        {
            var paymentModel = await _paymentRepo.GetPaymentById(id);
            if (paymentModel == null)
            {
                return NotFound();
            }
            return Ok(paymentModel);
        }

        /// <summary>
        /// Get all payments
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(typeof(Payment), 200)]
        [ProducesResponseType(400)]
        public async Task<IActionResult> GetAll()
        {
            var payments = await _paymentRepo.GetAllPayment();
            if (payments == null)
            {
                return NotFound();
            }
            //var response = new BaseResultWIthData<List<MerchantDtos>>();
            return Ok(payments);
        }

        /// <summary>
        /// Create payment via momo api
        /// </summary>
        /// <param name="createPayment"></param>
        /// <returns></returns>
        /// <remarks>
        ///     
        ///     POST
        ///     {
        ///     "paymentContent": "Thanh toan don hang 0001",
        ///     "paymentCurrency": "VND",
        ///     "paymentRefId": "ORD:12345",
        ///     "requiredAmount": 50000,
        ///     "paymentLanguage": "vi",
        ///     "merchantId": "MER0001",
        ///     "paymentDestinationId": "MOMO"
        ///     }
        /// </remarks>
        [HttpPost]
        [ProducesResponseType(typeof(PaymentLinkDtos), 200)]
        [ProducesResponseType(400)]
        public async Task<IActionResult> CreatePayment([FromBody] CreatePayment createPayment)
        {
            PaymentLinkDtos result = new();
            Payment paymentModel = await _paymentRepo.CreatePayment(createPayment.FromCreatePaymentToPayment())!;

            if (paymentModel != null)   //send one time payment request to Momo
            {
                //var momoOneTimePayRequest = new MomoOneTimePaymentRequest(
                //    _momoConfig.PartnerCode,
                //    "Momo",
                //    paymentModel.MerchantId!,
                //    "captureWallet",
                //    _momoConfig.IpnUrl,
                //    _momoConfig.ReturnUrl,
                //    paymentModel.PaymentRefId!,
                //    (long)paymentModel.RequiredAmount!,
                //    paymentModel.PaymentLanguage!,
                //    true,
                //    paymentModel.PaymentContent!,
                //    paymentModel.Id,
                //    "ew0KImVtYWlsIjogImh1b25neGRAZ21haWwuY29tIg0KfQ"
                //    );

                var momoOneTimePayRequest = new MomoOneTimePaymentRequest()
                {
                    partnerCode = _momoConfig.PartnerCode,
                    partnerName = "Momo",
                    storeId = paymentModel.MerchantId!,
                    requestType = "captureWallet",
                    ipnUrl = _momoConfig.IpnUrl,
                    redirectUrl = _momoConfig.ReturnUrl,
                    orderId = paymentModel.PaymentRefId!,
                    amount = (long)paymentModel.RequiredAmount!,
                    lang = paymentModel.PaymentLanguage!,
                    orderInfo = paymentModel.PaymentContent!,
                    requestId = paymentModel.Id
                };

                momoOneTimePayRequest.MakeSignature(_momoConfig.AccessKey, _momoConfig.SecretKey);

                (bool createMomoLinkResult, string? createMessage) = momoOneTimePayRequest.GetLink(_momoConfig.PaymentUrl);
                if (createMomoLinkResult)
                {
                    result.PaymentId = paymentModel.Id;
                    result.PaymentUrl = createMessage!;
                }
                else
                {
                    result.PaymentId = paymentModel.Id;
                    result.Message = createMessage!;
                }
            }//end payment is NOT null

            return Ok(result);
        }

    }
}
