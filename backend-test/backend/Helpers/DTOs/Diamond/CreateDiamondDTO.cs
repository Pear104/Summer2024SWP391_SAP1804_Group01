using BusinessObjects.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Diamond
{
    public class CreateDiamondDTO
    {
        [Required]
        public string Lab { get; set; } = string.Empty;

        [Required]
        public long CertificateNumber { get; set; }

        [Required]
        public string CertificateUrl { get; set; } = string.Empty;

        [Required]
        public string ImageUrl { get; set; } = string.Empty;

        [Required]
        public float Carat { get; set; }

        [Required]
        public string Cut { get; set; } = string.Empty;

        [Required]
        public Color Color { get; set; } = Color.V;

        [Required]
        public Clarity Clarity { get; set; } = Clarity.I3;

        [Required]
        public string Polish { get; set; } = string.Empty;

        [Required]
        public string Symmetry { get; set; } = string.Empty;

        [Required]
        public string Fluorescence { get; set; } = string.Empty;

        [Required]
        public bool Availability { get; set; } = true;

        [Required]
        public long ShapeId { get; set; }
    }
}
