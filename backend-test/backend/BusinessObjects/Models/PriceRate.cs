using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models
{
    [Table("price_rate")]
    public class PriceRate
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("price_rate_id")]
        public long PriceRateId { get; set; }

        [Column("account_id")]
        public long AccountId { get; set; }
        public Account Account { get; set; } = new Account();

        [Column("percent")]
        public float Percent { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public List<Order> Orders { get; set; } = new List<Order>();
    }
}
