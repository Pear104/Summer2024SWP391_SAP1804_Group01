using System.ComponentModel.DataAnnotations;

namespace backend.Services.DTOs
{
    public class CreateOrderDetailDTO
    {
        public float Size { get; set; }

        public long? DiamondId { get; set; }

        public long? AccessoryId { get; set; }
    }
}
