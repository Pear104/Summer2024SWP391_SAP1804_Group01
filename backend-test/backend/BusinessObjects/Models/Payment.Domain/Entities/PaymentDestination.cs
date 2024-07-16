using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObjects.Models.Payment.Domain.Common;

namespace BusinessObjects.Models.Payment.Domain.Entities
{
    [Table("payment_destination")]
    public class PaymentDestination : BaseAuditableEntity
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("Id", TypeName = "nvarchar(250)")]
        public string Id { get; set; } = string.Empty;

        [Column("DesLogo", TypeName = "nvarchar(250)")]
        public string? DesLogo { get; set; } = string.Empty;

        [Column("DesShortName", TypeName = "nvarchar(250)")]
        public string? DesShortName { get; set; } = string.Empty;

        [Column("DesName", TypeName = "nvarchar(50)")]
        public string? DesName { get; set; } = string.Empty;

        [Column("DesSortIndex", TypeName = "int")]
        public int? DesSortIndex { get; set; }

        //FK
        [Column("DesParentId", TypeName = "nvarchar(250)")]
        public string? DesParentId { get; set; } = string.Empty;
        public PaymentDestination? DesParent { get; set; }

        [Column("IsActive")]
        public bool? IsActive { get; set; }

        //One parent PaymentDestination can have many PaymentDestinations
        public List<PaymentDestination> PaymentDestinations { get; set; } =
            new List<PaymentDestination>();

        //One payment destination have many payments
        public List<Payment> Payments { get; set; } = new List<Payment>();
    }
}
