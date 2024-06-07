using System.ComponentModel.DataAnnotations;

namespace backend.DTOs
{
    public class CreateOrderDetailDTO
    {
        [Required]
        public float Size { get; set; }

        [Required]
        public required long DiamondId { get; set; }

        public long? AccessoryId { get; set; }
    }
}
