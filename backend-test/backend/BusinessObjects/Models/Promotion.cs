using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models
{
    [Table("promotion")]
    public class Promotion
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("promotion_id")]
        public long PromotionId { get; set; }

        [Column("promotion_name")]
        public required string PromotionName { get; set; }

        [Column("promotion_code")]
        [MaxLength(10), MinLength(6)]
        public required string PromotionCode { get; set; }

        [Column("discount_percent")]
        public float DiscountPercent { get; set; }

        [Column("start_time")]
        public DateTime StartTime { get; set; }

        [Column("end_time")]
        public DateTime EndTime { get; set; }

        public List<Order> Orders { get; set; } = new List<Order>();
    }
}
