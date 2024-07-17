using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models
{
    [Table("feedback")]
    public class Feedback
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("feedback_id")]
        public long FeedbackId { get; set; }

        [Column("customer_id")]
        public long? CustomerId { get; set; }
        public Account? Customer { get; set; }

        [Column("order_detail_id")]
        public long? OrderDetailId { get; set; }
        public OrderDetail? OrderDetail { get; set; }

        [Column("accessory_id")]
        public long? AccessoryId { get; set; }
        public Accessory? Accessory { get; set; } = new Accessory();

        [Column("score")]
        public int Score { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        [Column("content")]
        public string? Content { get; set; }
    }
}
