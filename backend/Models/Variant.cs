using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("variant")]
    public class Variant
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("variant_id")]
        public long Id { get; set; }

        [Column("setting_id")]
        public long SettingId { get; set; }
        public Setting Setting { get; set; }

        [Column("shape_id")]
        public long ShapeId { get; set; }
        public Shape Shape { get; set; }

        [Column("material_id")]
        public long MaterialId { get; set; }
        public Material Material { get; set; }

        [Column("price")]
        public double Price { get; set; }
        public List<VariantImage> VariantImages { get; set; } = new List<VariantImage>();

    }
}
