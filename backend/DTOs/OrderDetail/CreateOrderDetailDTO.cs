using System.ComponentModel.DataAnnotations;
using backend.DTOs.Accessory;
using backend.DTOs.DiamondPrice;

namespace backend.DTOs
{
    public class CreateOrderDetailDTO
    {
        [Required]
        public float Size { get; set; }
        [Required]
        public required long DiamondId { get; set; }
        public long? AccessoryId { get; set; }
        [Required]
        public required long DiamondPriceId { get; set; }
        public required long? MaterialPriceId { get; set; }

    }
}