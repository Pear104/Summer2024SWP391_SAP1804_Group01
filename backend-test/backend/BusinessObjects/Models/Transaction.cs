using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObjects.Enums;

namespace BusinessObjects.Models
{
    [Table("transaction")]
    public class Transaction
    {
        [Key]
        // [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("transaction_id")]
        public string TransactionId { get; set; } = string.Empty;

        [Column("order_id")]
        public string? OrderId { get; set; }
        public Order Order { get; set; } = new Order();

        [Column("payment_method")]
        public string PaymentMethod { get; set; } = string.Empty;

        [Column("amount")]
        [Range(0.01, double.MaxValue)]
        public double Amount { get; set; }

        [Column("transaction_status")]
        public TransactionStatus TransactionStatus { get; set; } = TransactionStatus.Pending;

        [Column("created_at")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}
