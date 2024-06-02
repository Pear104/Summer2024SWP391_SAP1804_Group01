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
        ///     "paymentRefId": "1717321122750:0123456778",
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
            //input payment request
            PaymentLinkDtos result = new();
            var paymentModel = createPayment.FromCreatePaymentToPayment();
            Payment newPayment = await _paymentRepo.CreatePayment(paymentModel);
            if (newPayment != null)
            {
                var momoOneTImePayRequest = new MomoOneTimePaymentRequest(
                    _momoConfig.PartnerCode,
                    "Momo",
                    newPayment.MerchantId,
                    "captureWallet",
                    _momoConfig.IpnUrl,
                    _momoConfig.ReturnUrl,
                    newPayment.PaymentRefId,
                    (long)newPayment.RequiredAmount,
                    newPayment.PaymentLanguage,
                    true,
                    newPayment.PaymentContent,
                    newPayment.Id,                    "ew0KImVtYWlsIjogImh1b25neGRAZ21haWwuY29tIg0KfQ"
                    );
                momoOneTImePayRequest.MakeSignature(_momoConfig.AccessKey, _momoConfig.SecretKey);
                (bool createMomoLinkResult, string? createMessage) = momoOneTImePayRequest.GetLink(_momoConfig.PaymentUrl);
                if (createMomoLinkResult)
                {
                    result.PaymentId = newPayment.Id;
                    result.PaymentUrl = createMessage;
                }
                else
                {
                    result.PaymentId = newPayment.Id;
                    result.PaymentUrl = createMessage;
                }
            }
            //output payment with link
            //return CreatedAtAction("GetById", new { id = newPayment.Id }, newPayment);
            return Ok(result);
        }

    }
}
