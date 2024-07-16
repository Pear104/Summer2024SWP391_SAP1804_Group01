﻿using System.ComponentModel.DataAnnotations.Schema;

namespace backend.BusinessOjects.Models.Payment.Domain
{
    public class BaseAuditableEntity
    {
        [Column("CreatedBy", TypeName = "nvarchar(50)")]
        public string CreatedBy { get; set; } = string.Empty;
        [Column("CreatedAt")]
        public DateTime? CreatedAt { get; set; }
        [Column("LastUpdatedBy", TypeName = "nvarchar(50)")]
        public string? LastUpdatedBy { get; set; } = string.Empty;
        [Column("LastUpdateAt")]
        public DateTime? LastUpdateAt { get; set; }

    }
}
