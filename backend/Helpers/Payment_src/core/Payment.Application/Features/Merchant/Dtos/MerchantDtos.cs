
namespace backend.Payment_src.core.Payment.Application.Features.Dtos
{
    public class MerchantDtos
    {
        public string Id { get; set; } = string.Empty;
        public string? MerchantName { get; set; } = string.Empty;
        public string? MerchantWebLink { get; set; } = string.Empty;
        public string? MerchentIpnUrl { get; set; } = string.Empty;
        public string? MerchantReturnUrl { get; set; } = string.Empty;
        public string IsActive { get; set; }
    }
}
