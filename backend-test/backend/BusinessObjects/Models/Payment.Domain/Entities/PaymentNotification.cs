using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models.Payment.Domain.Entities
{
    [Table("payment_notification")]
    public class PaymentNotification
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("Id", TypeName = "nvarchar(50)")]
        public string Id { get; set; } = string.Empty;

        [Column("PaymentRefId", TypeName = "nvarchar(50)")]
        public string? PaymentRefId { get; set; } = string.Empty;

        [Column("NotiDate")]
        public DateTime? NotiDate { get; set; }

        [Column("NotiContent", TypeName = "nvarchar(50)")]
        public string? NotiContent { get; set; } = string.Empty;

        [Column("NotiAmount", TypeName = "decimal(19,2)")]
        public decimal NotiAmount { get; set; }

        [Column("NotiMessage", TypeName = "nvarchar(50)")]
        public string? NotiMessage { get; set; } = string.Empty;

        [Column("NotiSignature", TypeName = "nvarchar(50)")]
        public string? NotiSignature { get; set; } = string.Empty;

        //FK
        //One notification belong to one payment
        [Column("NotiPaymentId", TypeName = "nvarchar(50)")]
        public string? NotiPaymentId { get; set; } = string.Empty;
        public Payment? NotiPayment { get; set; }

        //FK
        //One notification notify one merchant
        [Column("NotiMerchantId", TypeName = "nvarchar(250)")]
        public string? NotiMerchantId { get; set; } = string.Empty;
        public Merchant? NotiMerchant { get; set; }

        [Column("NotiStatus", TypeName = "nvarchar(50)")]
        public string? NotiStatus { get; set; } = string.Empty;

        [Column("NotiResDate")]
        public DateTime? NotiResDate { get; set; }

        //????
        [Column("NotiResMessage", TypeName = "nvarchar(50)")]
        public string? NotiResMessage { get; set; } = string.Empty;

        [Column("NotiResHttpCode", TypeName = "nvarchar(50)")]
        public string? NotiResHttpCode { get; set; } = string.Empty;
    }
}
