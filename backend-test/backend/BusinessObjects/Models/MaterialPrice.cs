using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models
{
    [Table("material_price")]
    public class MaterialPrice
    {
        [Key]
        [Column("material_price_id")]
        public long MaterialPriceId { get; set; }

        [Column("karat")]
        public int Karat { get; set; }

        [Column("eff_time")]
        public DateTime EffTime { get; set; } = DateTime.Now;

        [Column("unit_price")]
        [Range(0.01, double.MaxValue)]
        public double UnitPrice { get; set; }

        public List<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
    }
}
