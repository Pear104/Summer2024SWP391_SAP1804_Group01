using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
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
        public double ItemPrice { get; set; }
        [Column("order_id")]
        public long OrderId { get; set; }
        public Order Order { get; set; } = new Order();
        [Column("diamond_id")]
        public long DiamondId { get; set; }
        public Diamond Diamond { get; set; } = new Diamond();
        [Column("accessory_id")]
        public long AccessoryId { get; set; }
        public Accessory Accessory { get; set; } = new Accessory();

        [Column("warranty_card_id")]
        public long WarrantyCardId { get; set; }
        public WarrantyCard WarrantyCard { get; set; } = new WarrantyCard();

    }
}