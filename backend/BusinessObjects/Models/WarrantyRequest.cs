using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObjects.Enums;

namespace BusinessObjects.Models
{
    [Table("warranty_request")]
    public class WarrantyRequest
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("warranty_request_id")]
        public long WarrantyRequestId { get; set; }

        [Column("warranty_reason")]
        public string WarrantyReason { get; set; } = string.Empty;

        [Column("customer_id")]
        public long CustomerId { get; set; }
        public Account? Customer { get; set; }

        [Column("warranty_staff_id")]
        public long? WarrantyStaffId { get; set; }
        public Account? WarrantyStaff { get; set; }

        [Column("delivery_staff_id")]
        public long? DeliveryStaffId { get; set; }
        public Account? DeliveryStaff { get; set; }

        [Column("warranty_card_id")]
        public long WarrantyCardId { get; set; }
        public WarrantyCard WarrantyCard { get; set; } = new WarrantyCard();

        [Column("receive_time")]
        public DateTime ReceiveTime { get; set; }

        [Column("return_time")]
        public DateTime? ReturnTime { get; set; }

        [Column("warranty_status")]
        public WarrantyStatus WarrantyStatus { get; set; } = WarrantyStatus.Pending;

        [Column("shipping_address")]
        public string ShippingAddress { get; set; } = string.Empty;

        [Column("phone_number")]
        public string PhoneNumber { get; set; } = string.Empty;
    }
}
