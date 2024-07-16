using Helpers.DTOs.OrderDetail;

namespace Helpers.DTOs.Order
{
    public class CreateOrderDTO
    {
        public List<CreateOrderDetailDTO> OrderDetails { get; set; } =
            new List<CreateOrderDetailDTO>();
        public string? ShippingAddress { get; set; }
        public string? PhoneNumber { get; set; }
        public string? PromotionCode { get; set; }
    }
}
