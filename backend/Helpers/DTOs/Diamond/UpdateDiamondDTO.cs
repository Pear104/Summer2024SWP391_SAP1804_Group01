using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Diamond
{
    public class UpdateDiamondDTO
    {
        public string? Lab { get; set; }
        public long? CertificateNumber { get; set; }
        public string? CertificateUrl { get; set; }
        public string? ImageUrl { get; set; }
        public float Carat { get; set; }
        public string? Cut { get; set; }
        public string? Color { get; set; }
        public string? Clarity { get; set; }
        public string? Polish { get; set; }
        public string? Symmetry { get; set; }
        public string? Fluorescence { get; set; }
        public bool Availability { get; set; }
        public long ShapeId { get; set; }
    }
}
