namespace backend.DTOs.Order
{
    public class CreateOrderDTO
    {
        public List<CreateOrderDetailDTO> OrderDetails { get; set; } =
            new List<CreateOrderDetailDTO>();
        public string? ShippingAddress { get; set; }
        public string? PhoneNumber { get; set; }
        public long? PromotionId { get; set; }
    }
}
