﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("accessory")]
    public class Accessory
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("accessory_id")]
        public long Id { get; set; }

        [Column("karat")]
        public int Karat { get; set; }

        [Column("material_weight")]
        public float MaterialWeight { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Column("accessory_type_id")]
        public long AccessoryTypeId { get; set; }
        public AccessoryType AccessoryType { get; set; }

        [Column("shape_id")]
        public long ShapeId { get; set; }
        public Shape Shape { get; set; }

        public List<AccessoryImage> AccessoryImages { get; set; } = new List<AccessoryImage>();

    }
}