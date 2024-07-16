using backend.Payment_src.core.Payment.Service.Vnpay.Lib;
using System.Net;
using System.Text;
using Helpers.HelperClasses;

namespace backend.Payment_src.core.Payment.Service.Vnpay.Request
{
    public class VnpayPayRequest
    {
        public SortedList<string, string> requestData
    = new SortedList<string, string>(new VnpayCompare());

        /// <summary>
        /// Số tiền thanh toán. Số tiền không mang các ký tự phân tách thập phân, phần nghìn, ký tự tiền tệ. 
        /// Để gửi số tiền thanh toán là 10,000 VND (mười nghìn VNĐ) thì merchant cần nhân thêm 100 lần (khử phần thập phân), sau đó gửi sang VNPAY là: 1000000
        /// </summary>
        public decimal? vnp_Amount { get; set; }

        /// <summary>
        /// Mã API sử dụng, mã cho giao dịch thanh toán là: pay
        /// </summary>
        public string? vnp_Command { get; set; } = "pay";

        /// <summary>
        /// Là thời gian phát sinh giao dịch định dạng yyyyMMddHHmmss (Time zone GMT+7) 
        /// Ví dụ: 20220101103111
        /// </summary>
        public string? vnp_CreateDate { get; set; }

        public string? vnp_ExpireDate { get; set; }

        /// <summary>
        /// Đơn vị tiền tệ sử dụng thanh toán. Hiện tại chỉ hỗ trợ VND
        /// </summary>
        public string? vnp_CurrCode { get; set; }

        /// <summary>
        /// Mã phương thức thanh toán, mã loại ngân hàng hoặc ví điện tử thanh toán.
        ///Nếu không gửi sang tham số này, chuyển hướng người dùng sang VNPAY chọn phương thức thanh toán.
        ///Lưu ý:
        ///Các mã loại hình thức thanh toán lựa chọn tại website-ứng dụng của merchant
        ///vnp_BankCode=VNPAYQRThanh toán quét mã QR
        ///vnp_BankCode = VNBANKThẻ ATM - Tài khoản ngân hàng nội địa
        ///vnp_BankCode=INTCARDThẻ thanh toán quốc tế
        /// </summary>
        public string? vnp_BankCode { get; set; }

        /// <summary>
        /// Địa chỉ IP của khách hàng thực hiện giao dịch. Ví dụ: 13.160.92.202
        /// </summary>
        public string? vnp_IpAddr { get; set; }

        /// <summary>
        /// Ngôn ngữ giao diện hiển thị. Hiện tại hỗ trợ Tiếng Việt (vn), Tiếng Anh (en)
        /// </summary>
        public string? vnp_Locale { get; set; } = "vn";

        /// <summary>
        /// Thông tin mô tả nội dung thanh toán. 
        /// Quy định dữ liệu gửi sang VNPAY (Tiếng Việt không dấu và không bao gồm các ký tự đặc biệt)
        ///Ví dụ: Nap tien cho thue bao 0123456789. So tien 100,000 VND
        /// </summary>
        public string? vnp_OrderInfo { get; set; }

        /// <summary>
        /// Mã danh mục hàng hóa. Mỗi hàng hóa sẽ thuộc một nhóm danh mục do VNPAY quy định. 
        /// Xem thêm bảng Danh mục hàng hóa
        /// </summary>
        public string? vnp_OrderType { get; set; } = "other";

        /// <summary>
        /// URL thông báo kết quả giao dịch khi Khách hàng kết thúc thanh toán. 
        /// Ví dụ: https://domain.vn/VnPayReturn
        /// </summary>
        public string? vnp_ReturnUrl { get; set; }

        /// <summary>
        /// Mã website của merchant trên hệ thống của VNPAY. Ví dụ: 2QXUI4J4
        /// </summary>
        public string? vnp_TmnCode { get; set; }

        /// <summary>
        /// Mã tham chiếu của giao dịch tại hệ thống của merchant. 
        /// Mã này là duy nhất dùng để phân biệt các đơn hàng gửi sang VNPAY. 
        /// Không được trùng lặp trong ngày. Ví dụ: 23554
        /// </summary>
        public string? vnp_TxnRef { get; set; }

        /// <summary>
        /// Phiên bản api mà merchant kết nối. Phiên bản hiện tại là : 2.1.0
        /// </summary>
        public string? vnp_Version { get; set; }

        /// <summary>
        /// Mã kiểm tra (checksum) để đảm bảo dữ liệu của giao dịch không bị thay đổi trong quá trình chuyển từ merchant sang VNPAY. 
        /// Việc tạo ra mã này phụ thuộc vào cấu hình của merchant và phiên bản api sử dụng. 
        /// Phiên bản hiện tại hỗ trợ SHA256, HMACSHA512.
        /// </summary>
        public string? vnp_SecureHash { get; set; }

        public VnpayPayRequest() { }

        public VnpayPayRequest(string version,
            string tmnCode,
            DateTime createDate,
            string ipAddress,
            decimal amount,
            string currCode,
            string orderType,
            string orderInfo,
            string returnUrl,
            string txnRef)
        {
            this.vnp_Locale = "vn";
            this.vnp_IpAddr = ipAddress;
            this.vnp_Version = version;
            this.vnp_CurrCode = currCode;
            this.vnp_CreateDate = createDate.ToString("yyyyMMddHHmmss");
            this.vnp_TmnCode = tmnCode;
            this.vnp_Amount = (int)amount * 100;
            this.vnp_Command = "pay";
            this.vnp_OrderType = orderType;
            this.vnp_OrderInfo = orderInfo;
            this.vnp_ReturnUrl = returnUrl;
            this.vnp_TxnRef = txnRef;
        }

        public void MakeRequestData()
        {
            if (vnp_Amount != null)
                requestData.Add("vnp_Amount", vnp_Amount.ToString() ?? string.Empty);
            if (vnp_Command != null)
                requestData.Add("vnp_Command", vnp_Command);
            if (vnp_CreateDate != null)
                requestData.Add("vnp_CreateDate", vnp_CreateDate);
            if (vnp_CurrCode != null)
                requestData.Add("vnp_CurrCode", vnp_CurrCode);
            if (vnp_BankCode != null)
                requestData.Add("vnp_BankCode", vnp_BankCode);
            if (vnp_IpAddr != null)
                requestData.Add("vnp_IpAddr", vnp_IpAddr);
            if (vnp_Locale != null)
                requestData.Add("vnp_Locale", vnp_Locale);
            if (vnp_OrderInfo != null)
                requestData.Add("vnp_OrderInfo", vnp_OrderInfo);
            if (vnp_OrderType != null)
                requestData.Add("vnp_OrderType", vnp_OrderType);
            if (vnp_ReturnUrl != null)
                requestData.Add("vnp_ReturnUrl", vnp_ReturnUrl);
            if (vnp_TmnCode != null)
                requestData.Add("vnp_TmnCode", vnp_TmnCode);
            if (vnp_ExpireDate != null)
                requestData.Add("vnp_ExpireDate", vnp_ExpireDate);
            if (vnp_TxnRef != null)
                requestData.Add("vnp_TxnRef", vnp_TxnRef);
            if (vnp_Version != null)
                requestData.Add("vnp_Version", vnp_Version);
        }

        public string GetLink(string baseUrl, string secretKey)
        {
            MakeRequestData();
            StringBuilder data = new StringBuilder();
            foreach (KeyValuePair<string, string> kv in requestData)
            {
                if (!String.IsNullOrEmpty(kv.Value))
                {
                    data.Append(WebUtility.UrlEncode(kv.Key) + "=" + WebUtility.UrlEncode(kv.Value) + "&");
                }
            }

            string result = baseUrl + "?" + data.ToString();
            var secureHash = HashHelper.HmacSHA512(secretKey, data.ToString().Remove(data.Length - 1, 1));
            return result += "vnp_SecureHash=" + secureHash;
        }

    }
}
