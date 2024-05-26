using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("feedback")]
    public class Feedback
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("feedback_id")]
        public long FeedbackId { get; set; }

        [Column("order_id")]
        public long OrderId { get; set; }
        public Order Order { get; set; } = new Order();

        [Column("accessory_id")]
        public long AccessoryId { get; set; }
        public Accessory Accessory { get; set; } = new Accessory();

        [Column("score")]
        public int Score { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        [Column("content")]
        public string Content { get; set; } = String.Empty;
    }
}
