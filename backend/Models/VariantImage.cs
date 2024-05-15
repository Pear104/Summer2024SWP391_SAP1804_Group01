using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("variant_image")]
    public class VariantImage
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("image_id")]
        public long Id { get; set; }

        [Column("image_url")]
        public string Url { get; set; } = string.Empty;

        [Column("variant_id")]
        public long VariantID { get; set; }
        public Variant Variant { get; set; }
    }
}
