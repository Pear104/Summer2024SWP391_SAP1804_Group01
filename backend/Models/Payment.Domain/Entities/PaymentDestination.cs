using backend.Models.Payment.Domain;

namespace backend.Models.Payment.Domain.Entities
{
    public class PaymentDestination : BaseAuditableEntity
    {
        public string Id { get; set; } = string.Empty;
        public string? DesName { get; set; } = string.Empty;
        public string? DesShortName{ get; set; } = string.Empty;
        public string? DesParentId{ get; set; } = string.Empty;
        public string? DesLogo{ get; set; } = string.Empty;
        public int SortIndex { get; set; }
        public bool IsActive { get; set; }
    }
}
