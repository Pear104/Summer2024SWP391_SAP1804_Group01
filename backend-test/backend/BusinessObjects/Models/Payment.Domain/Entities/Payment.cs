using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models.Payment.Domain.Entities
{
    [Table("payment")]
    public class Payment
    {
        [Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("Id", TypeName = "nvarchar(50)")]
        public string Id { get; set; } = string.Empty;

        [Column("PaymentContent", TypeName = "nvarchar(250)")]
        public string PaymentContent { get; set; } = string.Empty;

        [Column("PaymentCurrency", TypeName = "nvarchar(250)")]
        public string PaymentCurrency { get; set; } = string.Empty;

        /// <summary>
        /// Which Store's order does this payment reference to?
        /// </summary>
        [Column("PaymentRefId", TypeName = "nvarchar(250)")]
        public string PaymentRefId { get; set; } = string.Empty;

        [Column("RequiredAmount", TypeName = "decimal(19, 2)")]
        public decimal? RequiredAmount { get; set; }

        //nullable?? dunno. Quick fixed => might be technical dept
        [Column("PaymentDate")]
        public DateTime PaymentDate { get; set; } = DateTime.Now;

        [Column("ExpireDate")]
        public DateTime? ExpireDate { get; set; }

        [Column("PaymentLanguage", TypeName = "nvarchar(250)")]
        public string? PaymentLanguage { get; set; } = string.Empty;

        //FK
        //One payment belong to one merchant
        [Column("MerchantId", TypeName = "nvarchar(250)")]
        public string? MerchantId { get; set; } = string.Empty;
        public Merchant? Merchant { get; set; }

        //FK
        //one payment belong to one paymentDestination
        /// <summary>
        /// How will this payment be performed? (VNPay, Momo, etc...)
        /// </summary>
        [Column("PaymentDestinationId", TypeName = "nvarchar(250)")]
        public string? PaymentDestinationId { get; set; } = string.Empty;
        public PaymentDestination? PaymentDestination { get; set; }

        [Column("PaidAmount", TypeName = "nvarchar(250)")]
        public string? PaidAmount { get; set; } = string.Empty;

        [Column("PaymentStatus", TypeName = "nvarchar(250)")]
        public string? PaymentStatus { get; set; } = string.Empty;

        [Column("PaymentLastMessage", TypeName = "nvarchar(250)")]
        public string? PaymentLastMessage { get; set; } = string.Empty;

        //One payment can have many notifications
        public List<PaymentNotification> Notifications { get; set; } =
            new List<PaymentNotification>();

        //One payment can contain many PaymentSignature
        public List<PaymentSignature> Signatures { get; set; } = new List<PaymentSignature>();

        //One payment can have many transactions
        public List<PaymentTransaction> Transactions { get; set; } = new List<PaymentTransaction>();

        //public void SetIdAfterCurrentTime()
        //{
        //    this.Id = DateTime.Now.Ticks.ToString() + "id";   //No special reason for this format, can be changed.
        //}

        //public void SetOrderIdAfterCurrentTime()
        //{
        //    this.PaymentRefId = DateTime.Now.Ticks.ToString()+":01234566789";
        //}
    }
}
