using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("warranty_card")]
    public class WarrantyCard
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("warranty_card_id")]
        public long WarrantyCardId { get; set; }

        [Column("order_detail_id")]
        public long OrderDetaiId { get; set; }
        public OrderDetail OrderDetail { get; set; }

        [Column("start_time")]
        public DateTime StartTime { get; set; } = DateTime.Now;

        [Column("end_time")]
        public DateTime EndTime { get; set; } = DateTime.Now.AddMonths(12);

        public List<WarrantyRequest> WarrantyRequests { get; set; } = new List<WarrantyRequest>();
    }
}
