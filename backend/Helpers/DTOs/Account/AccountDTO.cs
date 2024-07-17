using Helpers.DTOs.Order;
using Helpers.DTOs.Rank;
using Helpers.DTOs.WarrantyRequest;

namespace Helpers.DTOs.Account
{
    public class AccountDTO
    {
        public long AccountId { get; set; }
        public string? Role { get; set; }
        public RankDTO Rank { get; set; } = new RankDTO();
        public string Name { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public DateTime Birthday { get; set; }
        public string Gender { get; set; } = string.Empty;
        public int RewardPoint { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public List<OrderDTO> OrdersOfCustomer { get; set; } = new List<OrderDTO>();
        public List<OrderDTO> OrdersOfSaleStaff { get; set; } = new List<OrderDTO>();
        public List<OrderDTO> OrdersOfDeliveryStaff { get; set; } = new List<OrderDTO>();

        public List<WarrantyRequestDTO> WarrantyRequestsOfCustomer { get; set; } =
            new List<WarrantyRequestDTO>();
        public List<WarrantyRequestDTO> WarrantyRequestsOfWarrantyStaff { get; set; } =
            new List<WarrantyRequestDTO>();
        public List<WarrantyRequestDTO> WarrantyRequestsOfDeliveryStaff { get; set; } =
            new List<WarrantyRequestDTO>();

        public int TotalOrders { get; set; }
    }
}
