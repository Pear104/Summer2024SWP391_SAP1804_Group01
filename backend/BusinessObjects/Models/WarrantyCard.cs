using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObjects.Models
{
    [Table("warranty_card")]
    public class WarrantyCard
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("warranty_card_id")]
        public long WarrantyCardId { get; set; }

        [Column("order_detail_id")]
        public long OrderDetailId { get; set; }
        public OrderDetail? OrderDetail { get; set; }

        [Column("diamond_id")]
        public long? DiamondId { get; set; }
        public Diamond? Diamond { get; set; }

        [Column("accessory_id")]
        public long? AccessoryId { get; set; }
        public Accessory? Accessory { get; set; }

        [Column("start_time")]
        public DateTime StartTime { get; set; } = DateTime.Now;

        [Column("end_time")]
        public DateTime EndTime { get; set; } = DateTime.Now.AddMonths(12);

        public List<WarrantyRequest> WarrantyRequests { get; set; } = new List<WarrantyRequest>();
    }
}
