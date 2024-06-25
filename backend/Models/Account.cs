using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using backend.Enums;

namespace backend.Models
{
    [Table("account")]
    public class Account
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("account_id")]
        public long AccountId { get; set; }

        [Column("role")]
        public Role Role { get; set; } = Role.Customer;

        [Column("rank_id")]
        public long RankId { get; set; }
        public Rank Rank { get; set; } = new Rank();

        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Column("email")]
        public string Email { get; set; } = string.Empty;

        [Column("password")]
        public string Password { get; set; } = string.Empty;

        [Column("phone_number")]
        public string PhoneNumber { get; set; } = string.Empty;

        [Column("address")]
        public string Address { get; set; } = string.Empty;

        [Column("birthday")]
        public DateTime Birthday { get; set; }

        [Column("gender")]
        public Gender Gender { get; set; } = Gender.Other;

        [Column("reward_point")]
        public int RewardPoint { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        [Column("is_disable")]
        public bool IsDisable { get; set; } = false;

        public List<Order> OrdersOfCustomer { get; set; } = new List<Order>();
        public List<Order> OrdersOfSaleStaff { get; set; } = new List<Order>();
        public List<Order> OrdersOfDeliveryStaff { get; set; } = new List<Order>();
        public List<WarrantyRequest> WarrantyRequestsOfCustomer { get; set; } =
            new List<WarrantyRequest>();
        public List<WarrantyRequest> WarrantyRequestsOfSaleStaff { get; set; } =
            new List<WarrantyRequest>();
        public List<WarrantyRequest> WarrantyRequestsOfDeliveryStaff { get; set; } =
            new List<WarrantyRequest>();
        public List<Blog>? Blogs { get; set; }
        public List<Feedback>? Feedbacks { get; set; }
        public List<PriceRate>? PriceRates { get; set; }
    }
}
