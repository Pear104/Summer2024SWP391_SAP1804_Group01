using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("oder")]
    public class Order
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("order_id")]
        public long id { get; set; }
        [Column("total_price")]
        [Range(0.01, double.MaxValue)] 
        public double TotalPrice { get; set; }
        [Column("total_discount_percent")]
        public float TotalDiscountPercent { get; set; }
        [Column("contac_status")]
        public string ContactStatus { get; set; }
        [Column("confirm_status")]
        public string ConfirmStatus { get; set; }
        [Column("delevery_status")]
        public string DeliveryStatus { get; set; }
        [Column("orde_status")]
        public string OrderStatus { get; set; }
        [Column("shipping_address")]
        public string ShippingAddress { get; set; }
        [Column("create_at")]
        public DateTime CreateAt { get; set; }
        [Column("customer_id")]
        public int CustomerID { get; set; }
        public Account Customer {get; set;}
         [Column("sale_staff_id")]
        public int SaleStaffID { get; set; }
        public Account SaleStaff {get; set;}
         [Column("delivery_staff_id")]
        public int DeliveryStaffID { get; set; }
        public Account DeliveryStaff {get; set;}
        
        [Column("promotion_id")]
        public long PromotionID { get; set; }
        public Promotion Promotion {get; set;} = null;

        public List<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
    }
}