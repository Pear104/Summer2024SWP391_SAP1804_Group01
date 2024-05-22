using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("oder_detail")]
    public class OrderDetail
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("order_detail_id")]
        public long OrderDetailID { get; set; }
        [Column("size")]
        public float? size { get; set; }
        [Column("item_price")]
        public double ItemPrice { get; set; }
        [Column("order_id")]
        public long OrderID { get; set; }
        public Order Order {get;set;}
        [Column("diamond_id")]
        public long DiamondID { get; set; }
        public Diamond Diamond {get;set;} = null;
        [Column("accessory_id")]
        public long AccessoryID { get; set; }
        public Accessory Accessory {get; set;} = null;

    }
}