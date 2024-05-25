using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace backend.Models
{
    [Table("account")]
    public class Account
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("account_id")]
        public long AccountId { get; set; }

        [Column("role_id")]
        public long RoleId { get; set; }

        public Role Role { get; set; } = new Role();
        public Rank Rank { get; set; } = new Rank();

        [Column("rank_id")]
        public long RankId { get; set; }

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
        public string Gender { get; set; } = string.Empty;

        [Column("reward_point")]
        public int RewardPoint { get; set; }

        [Column("created_at")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public List<Order> OrdersOfCustomer { get; set; } = new List<Order>();
        public List<Order> OrdersOfSaleStaff { get; set; } = new List<Order>();
        public List<Order> OrdersOfDeliveryStaff { get; set; } = new List<Order>();
        public List<WarrantyRequest> RequestOfWarrantyStaff { get; set; } =
            new List<WarrantyRequest>();
        public List<Blog> Blogs { get; set; } = new List<Blog>();
        public List<PriceRate> PriceRates { get; set; } = new List<PriceRate>();

        //Ánh: Chưa rõ warranty request nên thêm vào ntn.
    }
}
