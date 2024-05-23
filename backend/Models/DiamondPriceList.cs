using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    public class DiamondPriceList
    {
        [Table("diamond_price_list")]
        public class MaterialPriceList
        {
            [Key]
            [DatabaseGenerated (DatabaseGeneratedOption.Identity)]
            [Column("diamond_price_list_id")]
            public long DiamondPriceListId { get; set; }

            [Column("eff_time")]
            public DateTime EffTime { get;set}

            [Column("min_carat_eff")]
            public float MinCaratEff { get;set}

            [Column("max_carat_eff")]
            public float MaxCaratEff { get; set; }

            [Column ("color")]
            public string Color { get; set; }

            [Column("clarity")]
            public string Clarity { get; set;}

            [Column("unit_price")]
            public double UnitPrice { get; set; }
        }
    }
}
