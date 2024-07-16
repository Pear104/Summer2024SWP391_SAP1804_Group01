using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models.Payment.Domain.Entities
{
    [Table("payment_transaction")]
    public class PaymentTransaction
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("Id", TypeName = "nvarchar(50)")]
        public string? Id { get; set; }

        [Column("TransMessage", TypeName = "nvarchar(250)")]
        public string? TransMessage { get; set; } = string.Empty;

        [Column("TranPayload", TypeName = "nvarchar(500)")]
        public string? TranPayload { get; set; } = string.Empty;

        [Column("TranStatus", TypeName = "nvarchar(10)")]
        public string? TranStatus { get; set; } = string.Empty;

        [Column("TranAmount", TypeName = "decimal(19, 2)")]
        public decimal? TranAmount { get; set; }

        [Column("TranDate")]
        public DateTime? TranDate { get; set; }

        //FK
        //One transaction belong to one payment
        [Column("PaymentId", TypeName = "nvarchar(50)")]
        public string? PaymentId { get; set; } = string.Empty;
        public Payment? Payment { get; set; }

        //FK??
        //user Id??
        [Column("TranRefId", TypeName = "nvarchar(250)")]
        public string? TranRefId { get; set; } = string.Empty;
        public Account? Account { get; set; }
    }
}
