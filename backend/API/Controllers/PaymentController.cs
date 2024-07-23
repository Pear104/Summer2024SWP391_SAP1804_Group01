using backend.Payment_src.core.Payment.Application.Features.Commands;
using backend.Payment_src.core.Payment.Application.Features.Payment.Dtos;
using backend.Payment_src.core.Payment.Service.Momo.Config;
using backend.Payment_src.core.Payment.Service.Momo.Request;
using backend.Payment_src.core.Payment.Service.Vnpay.Config;
using backend.Payment_src.core.Payment.Service.Vnpay.Request;
using backend.Payment_src.core.Payment.Service.Vnpay.Response;
using BusinessObjects.Models.Payment.Domain.Entities;
using Helpers.Extensions;
using Helpers.Mappers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Repositories.Interfaces.Payments;

namespace backend.Controllers
{
    [Route("api/payment")]
    [ApiController]
    public class PaymentController : ControllerBase
    {
        private readonly IPaymentRepository _paymentRepo;
        private readonly IPaymentSignatureRepository _paymentSignitureRepo;
        private readonly ICurrentUserService _currentUserService;

        private readonly VnpayConfig _vnpayConfig;
        private readonly MomoConfig _momoConfig;

        public PaymentController(
            IPaymentRepository paymentRepo,
            IPaymentSignatureRepository paymentSignitureRepo,
            ICurrentUserService currentUserService,
            IOptions<VnpayConfig> vnpayConfig,
            IOptions<MomoConfig> momoConfig
        )
        {
            _paymentRepo = paymentRepo;
            _paymentSignitureRepo = paymentSignitureRepo;
            _currentUserService = currentUserService;
            _vnpayConfig = vnpayConfig.Value;
            _momoConfig = momoConfig.Value;
        }

        [HttpGet]
        [Route("{id}")]
        [ProducesResponseType(typeof(Payment), 200)]
        [ProducesResponseType(400)]
        public async Task<IActionResult> GetById([FromRoute] string id)
        {
            var paymentModel = await _paymentRepo.GetPaymentById(id)!;
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
        [Route("momo-sent-request")]
        [ProducesResponseType(typeof(PaymentLinkDtos), 200)]
        [ProducesResponseType(400)]
        public async Task<IActionResult> CreateMomoPayment([FromBody] CreatePayment createPayment)
        {
            PaymentLinkDtos result = new();
            Payment paymentModel = await _paymentRepo.CreatePayment(
                createPayment.FromCreatePaymentToPayment()
            )!;

            if (paymentModel != null) //send one time payment request to Momo
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

                (bool createMomoLinkResult, string? createMessage) = momoOneTimePayRequest.GetLink(
                    _momoConfig.PaymentUrl
                );
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
            } //end payment is NOT null

            return Ok(result);
        }

        /// <summary>
        /// Create payment via vnpay api
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
        ///     "paymentLanguage": "vn",
        ///     "merchantId": "MER0001",
        ///     "paymentDestinationId": "VNPAY",
        ///     "signature": "123456789ABC"
        ///     }
        /// </remarks>
        [HttpPost]
        [Route("vnpay-sent-request")]
        [ProducesResponseType(typeof(PaymentLinkDtos), 200)]
        [ProducesResponseType(400)]
        public async Task<IActionResult> CreateVnpayPayment([FromBody] CreatePayment createPayment)
        {
            PaymentLinkDtos result = new();
            Payment paymentModel = await _paymentRepo.CreatePayment(
                createPayment.FromCreatePaymentToPayment()
            )!;

            if (paymentModel != null) //send one time payment request to Vnpay
            {
                //each payment go along with a signiture, dunno why :vv
                PaymentSignature paySigModel =
                    new()
                    {
                        PaymentId = paymentModel.Id,
                        SignValue = createPayment.Signature,
                        SignOwn = paymentModel.MerchantId,
                        SignDate = paymentModel.PaymentDate
                    };

                paySigModel = await _paymentSignitureRepo.CreateSigniture(paySigModel)!;

                if (paySigModel != null)
                {
                    var paymentUrl = string.Empty;
                    var vnpayPayRequest = new VnpayPayRequest()
                    {
                        vnp_Version = _vnpayConfig.Version,
                        vnp_TmnCode = _vnpayConfig.TmnCode,
                        vnp_CreateDate = paymentModel.PaymentDate.ToString("yyyyMMddHHmmss"),
                        vnp_IpAddr = _currentUserService.IpAddress ?? string.Empty,
                        vnp_Amount = paymentModel.RequiredAmount * 100,
                        vnp_CurrCode = paymentModel.PaymentCurrency,
                        //vnp_OrderType = "other",
                        vnp_OrderInfo = paymentModel.PaymentContent ?? string.Empty,
                        vnp_ReturnUrl = _vnpayConfig.ReturnUrl,
                        vnp_TxnRef = paymentModel.PaymentRefId
                    };

                    paymentUrl = vnpayPayRequest.GetLink(
                        _vnpayConfig.PaymentUrl,
                        _vnpayConfig.HashSecret
                    );
                    result.PaymentId = paymentModel.Id;
                    result.PaymentUrl = paymentUrl;
                } //end paySigModel is NOT null
            } //end paymentModel is null
            return Ok(result);
        }

        //[HttpGet]
        //[Route("momo-return")]
        //public async Task<IActionResult> MomoReturn(
        //    [FromQuery] MomoOneTimePaymentResultRequest resultRequest
        //)
        //{
        //    string returnUrl = string.Empty;
        //    var returnModel = new PaymentReturnDtos();

        //    //send link
        //    var processResult = await _paymentRepo.ProcessMomoPaymentReturn(resultRequest);
        //    if (processResult.Success)
        //    {
        //        returnModel = processResult.Data.Item1 as PaymentReturnDtos;
        //        returnUrl = processResult.Data.Item2 as string;
        //    }
        //    //dunnot what this does
        //    if (returnUrl.EndsWith("/"))
        //    {
        //        returnUrl = returnUrl.Remove(returnUrl.Length - 1, 1);
        //    }
        //    //dunnot what this does

        //    //return NotFound();
        //    return Redirect($"{returnUrl}?{returnModel.ToQueryString()}");
        //}

        [HttpGet]
        [Route("vnpay-return")]
        public async Task<IActionResult> HandleVnpayReturn([FromQuery] VnpayPayResponse response)
        {
            string returnUrl = string.Empty;
            var returnModel = new PaymentReturnDtos();
            //send link
            var processResult = await _paymentRepo.ProcessVnpayPaymentResponse(response);
            if (processResult.Success)
            {
                returnModel = processResult.Data.Item1 as PaymentReturnDtos;
                returnUrl = processResult.Data.Item2 as string;
            }
            //dunnot what this does
            if (returnUrl.EndsWith("/"))
            {
                returnUrl = returnUrl.Remove(returnUrl.Length - 1, 1);
            }
            //dunnot what this does

            //return NotFound();
            //redirect back to Merchant's page after a successful transaction
            return Redirect($"{returnUrl}?{returnModel.ToQueryString()}");
        }

        [HttpGet]
        [Route("vnpay-ipn")]
        public async Task<IActionResult> HandleVnpayIpn([FromQuery] VnpayPayResponse response)
        {
            string returnUrl = string.Empty;
            var returnModel = new VnpayPayIpnResponse();
            //send link
            var processResult = await _paymentRepo.ProcessVnpayIpnResponse(response);
            if (processResult.Success)
            {
                returnModel = processResult.Data as VnpayPayIpnResponse;
                //returnUrl = processResult.Data.Item2 as string;
            }
            //dunnot what this does
            //if (returnUrl.EndsWith("/"))
            //{
            //    returnUrl = returnUrl.Remove(returnUrl.Length - 1, 1);
            //}
            //dunnot what this does

            //return NotFound();
            //redirect back to Merchant's page after a successful transaction
            return Content(returnModel.ToQueryString());
        }
    }
}
