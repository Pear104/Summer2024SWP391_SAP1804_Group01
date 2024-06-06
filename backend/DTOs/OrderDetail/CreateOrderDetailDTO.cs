using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Accessory;
using backend.Models;

namespace backend.DTOs
{
    public class CreateOrderDetailDTO
    {
        [Required]
        public float Size { get; set; }
        [Required]
        public required DiamondDTO Diamond { get; set; }
        public AccessoryDTO? Accessory { get; set; }
        [Required]
        public required string ShippingAddress { get; set; }

    }
}