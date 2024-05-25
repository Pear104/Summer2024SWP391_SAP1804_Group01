using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs
{
    public class AccountDTO
    {
        public long AccountId { get; set; }

        public long RoleId { get; set; }
        public long RankId { get; set; }

        public RoleDTO Role { get; set; } = new RoleDTO();
        public RankDTO Rank { get; set; } = new RankDTO();

        public string Name { get; set; } = string.Empty;

        public string Email { get; set; } = string.Empty;

        public string Password { get; set; } = string.Empty;

        public string PhoneNumber { get; set; } = string.Empty;

        public string Address { get; set; } = string.Empty;

        public DateTime Birthday { get; set; }

        public string Gender { get; set; } = string.Empty;

        public int RewardPoint { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public List<OrderDTO> OrdersOfCustomer { get; set; } = new List<OrderDTO>();
        public List<OrderDTO> OrdersOfSaleStaff { get; set; } = new List<OrderDTO>();
        public List<OrderDTO> OrdersOfDeliveryStaff { get; set; } = new List<OrderDTO>();
        // public List<WarrantyRequest> RequestOfWarrantyStaff { get; set; } =
        //     new List<WarrantyRequest>();
        // public List<Blog> Blogs { get; set; } = new List<Blog>();
        // public List<PriceRate> PriceRates { get; set; } = new List<PriceRate>();
    }
}