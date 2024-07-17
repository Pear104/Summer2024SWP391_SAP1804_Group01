namespace backend.Payment_src.core.Payment.Application.Features.Commands
{

    public class CreateMerchant
    {
        /// <summary>
        /// The commands hold the sql string to talk directly to database ~~ repository
        /// </summary>
        public string? MerchantName { get; set; } = string.Empty;
        public string? MerchantWebLink { get; set; } = string.Empty;
        public string? MerchentIpnUrl { get; set; } = string.Empty;
        public string? MerchantReturnUrl { get; set; } = string.Empty;
        public bool IsActive { get; set; }
    }
}
