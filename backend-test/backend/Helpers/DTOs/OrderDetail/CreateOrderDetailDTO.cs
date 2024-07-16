using System.ComponentModel.DataAnnotations;

namespace Helpers.DTOs.OrderDetail
{
    public class CreateOrderDetailDTO
    {
        public float Size { get; set; }

        public long? DiamondId { get; set; }

        public long? AccessoryId { get; set; }
    }
}
