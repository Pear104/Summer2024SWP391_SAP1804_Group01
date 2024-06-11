using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("transaction")]
    public class Transaction
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("transaction_id")]
        public long TransactionId { get; set; }

        [Column("order_id")]
        public long OrderId { get; set; }
        public Order Order { get; set; } = new Order();

        [Column("payment_method")]
        public string PaymentMethod { get; set; } = String.Empty;

        [Column("amount")]
        [Range(0.01, double.MaxValue)]
        public double Amount { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}
