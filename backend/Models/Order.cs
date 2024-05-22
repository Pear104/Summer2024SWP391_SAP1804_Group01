using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("order")]
    public class Order
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("order_id")]
        public long OrderId { get; set; }
        [Column("total_price")]
        [Range(0.01, double.MaxValue)]
        public double TotalPrice { get; set; }
        [Column("total_discount_percent")]
        public float TotalDiscountPercent { get; set; }
        [Column("contact_status")]
        public string ContactStatus { get; set; } = string.Empty;
        [Column("confirm_status")]
        public string ConfirmStatus { get; set; } = string.Empty;
        [Column("delivery_status")]
        public string DeliveryStatus { get; set; } = string.Empty;
        [Column("order_status")]
        public string OrderStatus { get; set; } = string.Empty;
        [Column("shipping_address")]
        public string ShippingAddress { get; set; } = string.Empty;
        [Column("created_at")]
        public DateTime CreatedAt { get; set; }
        [Column("customer_id")]
        public long CustomerId { get; set; }
        public Account Customer { get; set; } = new Account();
        [Column("sale_staff_id")]
        public long SaleStaffId { get; set; }
        public Account SaleStaff { get; set; } = new Account();
        [Column("delivery_staff_id")]
        public long DeliveryStaffId { get; set; }
        public Account DeliveryStaff { get; set; } = new Account();

        [Column("promotion_id")]
        public long? PromotionId { get; set; }
        public Promotion? Promotion { get; set; } = null;

        public List<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
    }
}