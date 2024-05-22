using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace backend.Models
{
    public class WarrandtyCard
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("warranty_card_id")]
        public long WarantyCardId { get; set; }

        [Column("order_detail_id")]
        public long OrderDetaiId { get; set; }
        public OrderDetail OrderDetail { get; set; } = new OrderDetail();
        [Column("start_time")]
        public DateTime StartTime { get; set; }
        [Column("end_time")]
        public DateTime EndTime { get; set; }
        public List<WarrantyRequest> WarrantyRequests { get; set; } = new List<WarrantyRequest>();
    }
}
