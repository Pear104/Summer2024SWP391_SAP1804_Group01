using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models.Payment.Domain.Entities
{
    [Table("payment_signature")]
    public class PaymentSignature
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("Id", TypeName = "nvarchar(50)")]
        public string Id { get; set; } = string.Empty;

        [Column("SignValue", TypeName = "nvarchar(500)")]
        public string? SignValue { get; set; } = string.Empty;

        [Column("SignAlgo", TypeName = "nvarchar(50)")]
        public string? SignAlgo { get; set; } = string.Empty;

        [Column("SignDate")]
        public DateTime? SignDate { get; set; }

        [Column("SignOwn", TypeName = "nvarchar(50)")]
        public string? SignOwn { get; set; } = string.Empty;

        //FK
        //One paymentSignature belong to one payment
        [Column("PaymentId", TypeName = "nvarchar(50)")]
        public string? PaymentId { get; set; } = string.Empty;
        public Payment? Payment { get; set; }

        public bool IsValid { get; set; } = true;
    }
}
