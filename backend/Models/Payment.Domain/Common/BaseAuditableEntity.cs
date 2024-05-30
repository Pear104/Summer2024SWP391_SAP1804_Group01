using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models.Payment.Domain
{
    public class BaseAuditableEntity
    {
        [Column("CreatedBy")]
        public string CreatedBy { get; set; } = string.Empty;
        [Column("CreatedAt")]
        public DateTime? CreatedAt { get; set; }
        [Column("LastUpdatedBy")]
        public string? LastUpdatedBy { get; set; } = string.Empty;
        [Column("LastUpdateAt")]
        public DateTime? LastUpdateAt { get; set; }

    }
}
