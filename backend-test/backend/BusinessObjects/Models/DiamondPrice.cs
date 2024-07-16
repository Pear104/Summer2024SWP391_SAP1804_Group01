using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObjects.Enums;

namespace BusinessObjects.Models
{
    [Table("diamond_price")]
    public class DiamondPrice
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("diamond_price_id")]
        public long DiamondPriceId { get; set; }

        [Column("eff_time")]
        public DateTime EffTime { get; set; } = DateTime.Now;

        [Column("min_carat_eff")]
        public float MinCaratEff { get; set; }

        [Column("max_carat_eff")]
        public float MaxCaratEff { get; set; }

        [Column("color")]
        public Color Color { get; set; } = Color.V;

        [Column("clarity")]
        public Clarity Clarity { get; set; } = Clarity.I3;

        [Column("unit_price")]
        [Range(0.01, double.MaxValue)]
        public double UnitPrice { get; set; }

        public List<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
    }
}
