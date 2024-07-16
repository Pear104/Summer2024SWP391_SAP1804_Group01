namespace backend.Payment_src.core.Payment.Application.Features.Commands
{
    public class SetActiveMerchant
    {
        public string id { get; set; } = string.Empty;
        public bool IsActive { get; set; }
    }
}
