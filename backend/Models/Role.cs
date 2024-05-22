using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Models
{
    [Table("role")]
    public class Role
    {
        [Column("role_id")]
        public int RoleId { get; set; }
        [Column("role_name")]
        public string RoleName { get; set; } = string.Empty;
        public List<Account> Accounts { get; set; } = new List<Account>();
        
    }
}