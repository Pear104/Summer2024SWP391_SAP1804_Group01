using backend.Helper;
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
        [ProducesResponseType(typeof(PaymentDtos), 200)]
        [ProducesResponseType(400)]
        public async Task<IActionResult> GetAll()
        {
            var paymentModels = await _paymentRepo.GetAllPayment();
            if (paymentModels == null)
            {
                return NotFound();
            }
            var accountDTOs = paymentModels.Select(p => p.FromPaymentToPaymentDtos()).ToList();
            //var response = new BaseResultWIthData<List<MerchantDtos>>();
            return Ok(accountDTOs);
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

        [HttpGet]
        [Route("momo-return")]
        public async Task<IActionResult> MomoReturn([FromQuery]MomoOneTimePaymentResultRequest resultRequest)
        {
            string returnUrl = string.Empty;
            var returnModel = new PaymentReturnDtos();

            //send link
            var processResult = await _paymentRepo.ProcessMomoPaymentReturn(resultRequest);
            if (processResult.Success)
            {
                returnModel = processResult.Data.Item1 as PaymentReturnDtos;
                returnUrl = processResult.Data.Item2 as string;
            }
            //dunnot what this does
            if (returnUrl.EndsWith("/"))
            {
                returnUrl = returnUrl.Remove(returnUrl.Length- 1, 1);
            }
            //dunnot what this does

            //return NotFound();
            return Redirect($"{returnUrl}?{returnModel.ToQueryString()}");
        }

    }
}
