using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("role")]
    public class Role
    {
        [Column("role_id")]
        public long RoleId { get; set; }

        [Column("role_name")]
        public string RoleName { get; set; } = string.Empty;
        public List<Account> Accounts { get; set; } = new List<Account>();
    }
}
