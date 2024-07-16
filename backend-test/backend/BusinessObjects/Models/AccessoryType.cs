using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models
{
    [Table("accessory_type")]
    public class AccessoryType
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("accessory_type_id")]
        public long AccessoryTypeId { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Column("processing_price")]
        public double ProcessingPrice { get; set; }

        public List<Accessory> Accessories { get; set; } = new List<Accessory>();
    }
}
