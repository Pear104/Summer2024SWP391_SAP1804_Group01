using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("accessory_image")]
    public class AccessoryImage
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("image_id")]
        public long Id { get; set; }

        [Column("image_url")]
        public string Url { get; set; } = string.Empty;

        [Column("accessory_id")]
        public long AccessoryId { get; set; }
        public Accessory Accessory { get; set; }
    }
}
