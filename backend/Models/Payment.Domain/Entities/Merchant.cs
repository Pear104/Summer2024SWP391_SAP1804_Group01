using backend.Models.Payment.Domain;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models.Payment.Domain.Entities
{
    [Table("merchant")]
    public class Merchant : BaseAuditableEntity
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]   //will change GenerateOption later if deem nessearry
        [Column("Id")]
        public string Id { get; set; } = string.Empty;
        [Column("MerchantName")]
        public string? MerchantName { get; set; } = string.Empty;
        [Column("MerchantWebLink")]
        public string? MerchantWebLink { get; set; } = string.Empty;
        [Column("MerchentIpnUrl")]
        public string? MerchentIpnUrl { get; set; } = string.Empty;
        [Column("MerchantReturnUrl")]
        public string? MerchantReturnUrl { get; set; } = string.Empty;
        [Column("SecretKey")]
        public string? SecretKey { get; set; } = string.Empty;
        [Column("IsActive")]
        public string IsActive { get; set; }

    }
}
