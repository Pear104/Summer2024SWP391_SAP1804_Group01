namespace backend.Payment_src.core.Payment.Application.Features.Commands
{

    public class CreateMerchant
    {
        
        public string? MerchantName { get; set; } = string.Empty;
        public string? MerchantWebLink { get; set; } = string.Empty;
        public string? MerchentIpnUrl { get; set; } = string.Empty;
        public string? MerchantReturnUrl { get; set; } = string.Empty;
        public string IsActive { get; set; }
    }
}
