using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObjects.Enums;

namespace BusinessObjects.Models
{
    [Table("order")]
    public class Order
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("order_id")]
        public string OrderId { get; set; } = DateTime.Now.Ticks.ToString();

        [Column("total_price")]
        [Range(0.01, double.MaxValue)]
        public double TotalPrice { get; set; }

        [Column("total_discount_percent")]
        [Range(0.01, float.MaxValue)]
        public float TotalDiscountPercent { get; set; }

        [Column("rank_id")]
        public long RankId { get; set; }
        public Rank Rank { get; set; } = new Rank();

        [Column("price_rate_id")]
        public long PriceRateId { get; set; }
        public PriceRate PriceRate { get; set; } = new PriceRate();

        [Column("order_status")]
        public OrderStatus OrderStatus { get; set; } = OrderStatus.Pending;

        [Column("shipping_address")]
        public string ShippingAddress { get; set; } = string.Empty;

        [Column("phone_number")]
        public string PhoneNumber { get; set; } = string.Empty;

        [Column("created_at")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        [Column("customer_id")]
        public long CustomerId { get; set; }
        public Account? Customer { get; set; } = new Account();

        [Column("sale_staff_id")]
        public long? SaleStaffId { get; set; }
        public Account? SaleStaff { get; set; }

        [Column("delivery_staff_id")]
        public long? DeliveryStaffId { get; set; }
        public Account? DeliveryStaff { get; set; }

        [Column("promotion_id")]
        public long? PromotionId { get; set; }
        public Promotion? Promotion { get; set; }
        public List<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
        public List<Transaction> Transactions { get; set; } = new List<Transaction>();
    }
}
