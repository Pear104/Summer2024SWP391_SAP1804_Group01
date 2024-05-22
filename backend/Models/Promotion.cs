using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("promotion")]
    public class Promotion
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("promotion_id")]
        public long PromotionId { get; set; }
        [Column("discount_percent")]
        public float DiscountPercent { get; set; }
        [Column("start_time")]
        public DateTime StartTime { get; set; }
        [Column("end_time")]
        public DateTime Endtime { get; set; }

        public List<Order> Orders { get; set; } = new List<Order>();
    }
}