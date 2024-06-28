using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("accessory")]
    public class Accessory
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("accessory_id")]
        public long AccessoryId { get; set; }

        [Column("karat")]
        public int Karat { get; set; }

        [Column("material_weight")]
        public float MaterialWeight { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Column("quantity")]
        public int Quantity { get; set; }

        [Column("is_hidden")]
        public bool IsHidden { get; set; } = false;

        [Column("accessory_type_id")]
        public long AccessoryTypeId { get; set; }
        public AccessoryType AccessoryType { get; set; } = new AccessoryType();

        [Column("shape_id")]
        public long ShapeId { get; set; }
        public Shape Shape { get; set; } = new Shape();

        public List<AccessoryImage> AccessoryImages { get; set; } = new List<AccessoryImage>();
        public List<WarrantyCard> WarrantyCards { get; set; } = new List<WarrantyCard>();
        public List<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
        public List<Feedback> Feedbacks { get; set; } = new List<Feedback>();
    }
}
