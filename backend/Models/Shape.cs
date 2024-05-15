using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("shape")]
    public class Shape
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("shape_id")]
        public long Id { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;
        public List<Variant> Variants { get; set; } = new List<Variant>();
        public List<Diamond> Diamonds { get; set; } = new List<Diamond>();

    }
}
