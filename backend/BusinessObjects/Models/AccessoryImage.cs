using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models
{
    [Table("accessory_image")]
    public class AccessoryImage
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("image_id")]
        public long AccessoryImageId { get; set; }

        [Column("image_url")]
        public string Url { get; set; } = string.Empty;

        [Column("accessory_id")]
        public long AccessoryId { get; set; }
        public Accessory Accessory { get; set; } = new Accessory();
    }
}
