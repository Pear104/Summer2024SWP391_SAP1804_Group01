using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models
{
    [Table("shape")]
    public class Shape
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("shape_id")]
        public long ShapeId { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;
        public List<Accessory> Accessories { get; set; } = new List<Accessory>();
        public List<Diamond> Diamonds { get; set; } = new List<Diamond>();
    }
}
