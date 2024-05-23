using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

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
        [Column("transaction_status")]
        public string TransactionStatus { get; set; } = String.Empty;
        [Column("created_at")]
        public DateTime CreatedAt { get; set; }
        
    }
}
