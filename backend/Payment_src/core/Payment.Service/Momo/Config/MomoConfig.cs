namespace backend.Payment_src.core.Payment.Service.Momo.Config
{
    public class MomoConfig
    {
        public static string ConfigName => "Momo";
        public string PartnerCode { get; set; } = string.Empty;
        public string ReturnUrl { get; set; } = string.Empty;
        public string IpnUrl { get; set; } = string.Empty;
        public string AccessKey { get; set; } = string.Empty;
        public string SecretKey { get; set; } = string.Empty;
        public string PaymentUrl { get; set; } = string.Empty;
    }
}
