using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObjects.Enums;

namespace BusinessObjects.Models
{
    [Table("diamond")]
    public class Diamond
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("diamond_id")]
        public long DiamondId { get; set; }

        [Column("lab")]
        public string Lab { get; set; } = string.Empty;

        [Column("certificate_number")]
        public long CertificateNumber { get; set; }

        [Column("certificate_url")]
        public string CertificateUrl { get; set; } = string.Empty;

        [Column("image_url")]
        public string ImageUrl { get; set; } = string.Empty;

        [Column("carat")]
        [Range(0.001, float.MaxValue)]
        public float Carat { get; set; }

        [Column("cut")]
        public string Cut { get; set; } = string.Empty;

        [Column("color")]
        public Color Color { get; set; } = Color.V;

        [Column("clarity")]
        public Clarity Clarity { get; set; } = Clarity.I3;

        [Column("polish")]
        public string Polish { get; set; } = string.Empty;

        [Column("symmetry")]
        public string Symmetry { get; set; } = string.Empty;

        [Column("fluorescence")]
        public string Fluorescence { get; set; } = string.Empty;

        [Column("availability")]
        public bool Availability { get; set; } = true;

        [Column("is_hidden")]
        public bool IsHidden { get; set; } = true;

        [Column("shape_id")]
        public long ShapeId { get; set; }
        public Shape Shape { get; set; } = new Shape();

        public List<OrderDetail>? OrderDetails { get; set; }
        public List<WarrantyCard> WarrantyCards { get; set; }
    }
}
