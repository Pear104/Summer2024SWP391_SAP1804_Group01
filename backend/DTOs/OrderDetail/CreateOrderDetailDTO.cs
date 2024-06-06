using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using backend.Models;

namespace backend.DTOs
{
    public class CreateOrderDetailDTO
    {
        [Required]
        public float Size { get; set; }
        [Required]
        public long DiamondId { get; set; }
        public long? AccessoryId { get; set; }
        [Required]
        public string ShippingAddress { get; set; }
    }
}