namespace Helpers.DTOs.Diamond
{
    public class DiamondDTO
    {
        public long DiamondId { get; set; }
        public string Lab { get; set; } = string.Empty;
        public long CertificateNumber { get; set; }
        public string CertificateUrl { get; set; } = string.Empty;
        public string ImageUrl { get; set; } = string.Empty;
        public float Carat { get; set; }
        public string Cut { get; set; } = string.Empty;
        public string Color { get; set; } = string.Empty;
        public string Clarity { get; set; } = string.Empty;
        public string Polish { get; set; } = string.Empty;
        public string Symmetry { get; set; } = string.Empty;
        public string Fluorescence { get; set; } = string.Empty;
        public bool Availability { get; set; } = true;
        public bool IsHidden { get; set; } = true;
        public string Shape { get; set; } = string.Empty;
        public long ShapeId { get; set; }
    }
}
