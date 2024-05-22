using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace backend.Models
{
    public class WarrantyRequest
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("warranty_request_id")]
        public long WarantyRequestId { get; set; }

        [Column("warranty_staff_id")]
        public long WarrantyStaffId { get; set; }
        public Account WarrantyStaff { get; set; } = new Account();
        [Column("warranty_card_id")]
        public long WarrantyCardId { get; set; }
        public WarrandtyCard WarrandtyCard { get; set;} = new WarrandtyCard();
        [Column("receive_time")]
        public DateTime ReceiveTime { get; set; }
        [Column("return_time")]
        public DateTime ReturnTime { get; set; }
        [Column("warranty_status")]
        public string WarrantyStatus { get; set; } = String.Empty;


    }

}
