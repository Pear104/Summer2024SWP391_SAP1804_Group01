using backend.Payment_src.core.Payment.Service.Momo.Response;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using Helpers.HelperClasses;

namespace backend.Payment_src.core.Payment.Service.Momo.Request
{
    public class MomoOneTimePaymentRequest
    {
        public MomoOneTimePaymentRequest()
        {
            
        }
        public MomoOneTimePaymentRequest(string partnerCode,
            string partnerName,
            string storeId,
            string requestType,
            string ipnUrl,
            string redirectUrl,
            string orderId,
            long amount,
            string lang,
            bool autoCapture,
            string oderInfo,
            string requestId,
            string extraData
            )
        {
            this.partnerCode = partnerCode;
            this.partnerName = partnerName;
            this.storeId = storeId;
            this.requestId = requestId;
            this.amount = amount;
            this.orderId = orderId;
            this.orderInfo = oderInfo;
            this.redirectUrl = redirectUrl;
            this.ipnUrl = ipnUrl;
            this.extraData = extraData;
            this.requestType = requestType;
            this.lang = lang;
            this.autoCapture = autoCapture;
        }
        /// <summary>
        /// Momo's business account Id
        /// </summary>
        public string partnerCode { get; set; } = string.Empty;
        
        /// <summary>
        /// Name of the business account. 
        /// (I honestly don't know where this came from)
        /// </summary>
        public string partnerName { get; set; } = "Momo";   //mock up => tobe refactor later
        
        /// <summary>
        /// Setting to automatically capture payment on Momo side - OPTIONAL
        /// </summary>
        public bool autoCapture { get; set; } = true;   //mock up => tobe refactor later

        /// <summary>
        /// In this context, Merchant Id - OPTIONAL
        /// </summary>
        public string storeId { get; set; } = string.Empty;   //mock up => tobe refactor later

        /// <summary>
        /// The Id of the Payment
        /// (NOT MomoOneTimePayment)
        /// To handle idempotency (only one payment/transaction operation happen on Momo side no matter how many request is sent)
        /// </summary>
        public string requestId { get; set; } = string.Empty;

        /// <summary>
        /// Store's orderId/billId. 1 orderId/billId ~ 1 Momo's TID/transId 
        /// </summary>
        public string orderId { get; set; } = string.Empty;

        /// <summary>
        /// Amount of money need to be paid
        /// Min: 1.000 VND
        /// Max: 50.000.000 VND
        /// Currency: VND
        /// Data type: Long
        /// </summary>
        public long amount { get; set; }

        /// <summary>
        /// Infomation of Store's order
        /// </summary>
        public string orderInfo { get; set; } = string.Empty;

        /// <summary>
        /// Default value is empty ""
        /// A partner's URL. This URL is used to redirect from MoMo page to partner's page after customer's payment.
        /// </summary>
        public string redirectUrl { get; set; } = string.Empty;

        /// <summary>
        /// Partner API. Used by MoMo to submit payment results by IPN method (server-to-server) method
        /// </summary>
        public string ipnUrl { get; set; } = string.Empty;

        /// <summary>
        /// captureWallet = One-Time-Payment
        /// </summary>
        public string requestType { get; set; } = string.Empty;

        /// <summary>
        /// Default value is empty ""
        /// Encode base64 follow Jsonformat: {"key":"value"}
        /// Example with data: {"username":"momo","skus":"value1,value2"}
        /// => data of extraData: eyJ1c2VybmFtZSI6Im1vbW8iLCJza3VzIjoidmFsdWUxLHZhbHVlMiJ9
        /// </summary>
        public string extraData { get; set; } = string.Empty;

        /// <summary>
        /// Language of returned message (vi or en)
        /// </summary>
        public string lang { get; set; } = string.Empty;

        /// <summary>
        /// Signature to confirm information. Secure transaction in Hmac_SHA256 with format: a String sort all key name of data field from a-z:
        /// accessKey=$accessKey&amp;amount=$amount&amp;extraData=$extraData
        /// &amp;ipnUrl=$ipnUrl&amp;orderId=$orderId&amp;orderInfo=$orderInfo&amp;partnerCode=$partnerCode&amp;redirectUrl=$redirectUrl&amp;requestId=$requestId&amp;requestType=$requestType
        /// </summary>
        public string signature { get; set; } = string.Empty;

        public void MakeSignature(string accessKey, string secretKey)
        {
            var rawhash = "accessKey=" + accessKey +
                "&amount=" + this.amount +
                "&extraData=" + this.extraData +
                "&ipnUrl=" + this.ipnUrl +
                "&orderId=" + this.orderId +
                "&orderInfo=" + this.orderInfo +
                "&partnerCode=" + this.partnerCode +
                "&redirectUrl=" + this.redirectUrl +
                "&requestId=" + this.requestId +
                "&requestType=" + this.requestType;
            this.signature = HashHelper.HmacSHA256(rawhash, secretKey);

        }

        public (bool, string?) GetLink(string paymentUrl)
        {
            using HttpClient client = new HttpClient();

            //Convert the entire object into a json format
            var requestData = JsonConvert.SerializeObject(this, new JsonSerializerSettings()
            {
                ContractResolver = new CamelCasePropertyNamesContractResolver(),
                Formatting = Formatting.Indented,
            });

            var requestContent = new StringContent(requestData, Encoding.UTF8, "application/json");

            //send request to Momo api
            var createPaymentLinkRes = client.PostAsync(paymentUrl, requestContent).Result;

            if (createPaymentLinkRes.IsSuccessStatusCode)
            {
                var responseContent = createPaymentLinkRes.Content.ReadAsStringAsync().Result;
                var responseData = JsonConvert.DeserializeObject<MomoOneTimePaymentCreateLinkResponse>(responseContent);
                if (responseData!.resultCode == "0")
                {
                    return (true, responseData.payUrl);

                }
                else
                {
                    return (false, responseData.message);
                }
            }
            else
            {
                return (false, createPaymentLinkRes.ReasonPhrase);
            }

        }
    }
}
