using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table ("material_price_list")]
    public class MaterialPriceList
    {
        [Key]
        [Column ("material_price_list_id")]
        public long MaterialPriceListId { get; set; }

        [Column("karat")]
        public int Karat {  get; set; }

        [Column("eff_time")]
        public DateTime EffTime { get; set}

        [Column("unit_price")]
        public double UnitPrice { get; set; }
    }
}
