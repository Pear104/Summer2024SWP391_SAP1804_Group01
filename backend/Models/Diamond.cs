using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("diamond")]
    public class Diamond
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("diamond_id")]
        public long Id { get; set; }

        [Column("lab")]
        public string Lab { get; set; }

        [Column("certificate_number")]
        public long CertificateNumber { get; set; }

        [Column("certificate_url")]
        public string CertificateUrl { get; set; }

        [Column("image_url")]
        public string ImageUrl { get; set; }

        [Column("carat")]
        public float Carat { get; set; }

        [Column("cut")]
        public string Cut { get; set; }

        [Column("color")]
        public string Color { get; set; }

        [Column("clarity")]
        public string Clarity { get; set; }

        [Column("polish")]
        public string Polish { get; set; }

        [Column("symmetry")]
        public string Symmetry { get; set; }

        [Column("fluorescence")]
        public string Fluorescence { get; set; }

        [Column("availability")]
        public bool Availability { get; set; } = true;

        [Column("shape_id")]
        public long ShapeId { get; set; }
        public Shape Shape { get; set; }
    }
}
