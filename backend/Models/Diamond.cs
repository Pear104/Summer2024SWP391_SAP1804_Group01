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

        [Column("certificate_id")]
        public long CertificateId { get; set; }

        [Column("lab_name")]
        public string LabName { get; set; }

        [Column("carat")]
        public double Carat { get; set; }

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

        [Column("fluorescene")]
        public string Fluorescene { get; set; }

        [Column("price")]
        public double Price { get; set; }

        [Column("availability")]
        public bool Availability { get; set; }

        [Column("shape_id")]
        public long ShapeId { get; set; }
        public Shape Shape { get; set; }
    }
}
