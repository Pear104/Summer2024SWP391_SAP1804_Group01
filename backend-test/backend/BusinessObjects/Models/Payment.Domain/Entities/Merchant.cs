using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObjects.Models.Payment.Domain.Common;

namespace BusinessObjects.Models.Payment.Domain.Entities
{
    [Table("merchant")]
    public class Merchant : BaseAuditableEntity
    {
        /// <summary>
        /// 1 merchant id ~ 1 store
        /// </summary>
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("Id", TypeName = "nvarchar(250)")]
        public string Id { get; set; } = string.Empty;

        [Column("MerchantName", TypeName = "nvarchar(250)")]
        public string? MerchantName { get; set; } = string.Empty;

        [Column("MerchantWebLink", TypeName = "nvarchar(250)")]
        public string? MerchantWebLink { get; set; } = string.Empty;

        [Column("MerchentIpnUrl", TypeName = "nvarchar(250)")]
        public string? MerchantIpnUrl { get; set; } = string.Empty;

        [Column("MerchantReturnUrl", TypeName = "nvarchar(250)")]
        public string? MerchantReturnUrl { get; set; } = string.Empty;

        [Column("SecretKey", TypeName = "nvarchar(50)")]
        public string? SecretKey { get; set; } = string.Empty;

        [Column("IsActive")]
        public bool IsActive { get; set; }

        //One merchant can submit many payments
        public List<Payment>? Payments { get; set; } = new List<Payment>();

        //One merchannt can have many notification
        public List<PaymentNotification> Notifications { get; set; } =
            new List<PaymentNotification>();

        //turn this into a extention class
        public string GenerateHashedId()
        {
            // Example hash function (you can replace this with your actual hash function)
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                var hashedBytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(Id));
                //return BitConverter.ToString(hashedBytes).Replace("-", "").Substring(0, 8); // Taking first 8 characters for simplicity
                return BitConverter.ToString(hashedBytes).Replace("-", ""); // Taking first 8 characters for simplicity
            }
        }
    }
}
