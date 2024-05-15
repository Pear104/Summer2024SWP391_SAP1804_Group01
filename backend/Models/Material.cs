using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("material")]
    public class Material
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("material_id")]
        public long Id { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;
        public List<Variant> Variants { get; set; } = new List<Variant>();
    }
}
