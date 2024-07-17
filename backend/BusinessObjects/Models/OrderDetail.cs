using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models
{
    [Table("order_detail")]
    public class OrderDetail
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("order_detail_id")]
        public long OrderDetailId { get; set; }

        [Column("size")]
        public float? Size { get; set; }

        [Column("item_price")]
        [Range(0.01, double.MaxValue)]
        public double? ItemPrice { get; set; }

        [Column("order_id")]
        public string? OrderId { get; set; }
        public Order Order { get; set; } = new Order();

        [Column("diamond_id")]
        public long? DiamondId { get; set; }
        public Diamond Diamond { get; set; } = new Diamond();

        [Column("accessory_id")]
        public long? AccessoryId { get; set; }
        public Accessory? Accessory { get; set; }

        [Column("diamond_price_id")]
        public long DiamondPriceId { get; set; }
        public DiamondPrice DiamondPrice { get; set; } = new DiamondPrice();

        [Column("material_price_id")]
        public long? MaterialPriceId { get; set; }
        public MaterialPrice? MaterialPrice { get; set; }

        public List<WarrantyCard>? WarrantyCards { get; set; }

        [Column("feedback_id")]
        public long? FeedbackId { get; set; }
        public Feedback? Feedback { get; set; }
    }
}
