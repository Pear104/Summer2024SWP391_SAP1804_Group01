using backend.Helper;
using backend.Payment_src.core.Payment.Service.Momo.Response;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace backend.Payment_src.core.Payment.Service.Momo.Request
{
    public class MomoOneTimePaymentRequest
    {
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

        public string partnerCode { get; set; } = string.Empty;
        public string partnerName { get; set; } = "Momo";   //mock up => tobe refactor later
        public bool autoCapture { get; set; } = true;   //mock up => tobe refactor later
        public string storeId { get; set; } = string.Empty;   //mock up => tobe refactor later
        public string requestId { get; set; } = string.Empty;
        public string orderId { get; set; } = string.Empty;
        public long amount { get; set; }
        public string orderInfo { get; set; } = string.Empty;
        public string redirectUrl { get; set; } = string.Empty;
        public string ipnUrl { get; set; } = string.Empty;
        public string requestType { get; set; } = string.Empty;
        public string extraData { get; set; } = string.Empty;
        public string lang { get; set; } = string.Empty;
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
            //this.signature = rawhash;

        }

        public (bool, string?) GetLink(string paymentUrl)
        {
            using HttpClient client = new HttpClient();
            var requestData = JsonConvert.SerializeObject(this, new JsonSerializerSettings()
            {
                ContractResolver = new CamelCasePropertyNamesContractResolver(),
                Formatting = Formatting.Indented,
            });

            var requestContent = new StringContent(requestData, Encoding.UTF8, "application/json");

            var createPaymentLinkRes = client.PostAsync(paymentUrl, requestContent).Result;
            if (createPaymentLinkRes.IsSuccessStatusCode)
            {
                var responseContent = createPaymentLinkRes.Content.ReadAsStringAsync().Result;
                var responseData = JsonConvert.DeserializeObject<MomoOneTimePaymentCreateLinkResponse>(responseContent);
                if (responseData.resultCode == "0")
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
