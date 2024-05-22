using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Models
{
    [Table("account")]
    public class Account
    {
        [Column("account_id")]
        public long Id { get; set; }
        [Column("role_id")]
        public long RoleId { get; set; }
        [Column("rank_id")]
        public long RankId { get; set; }
        [Column("name")]
        public string Name { get; set; } = string.Empty;
        [Column("email")]
        public string Email { get; set; } = string.Empty;
        [Column("password")]
        public string Password { get; set; } = string.Empty;
        [Column("phone_number")]
        public string PhoneNumber { get; set; } = string.Empty;
        [Column("address")]
        public string Address { get; set; } = string.Empty;
        [Column("birthday")]
        public DateTime Birthday { get; set; }
        [Column("gender")]
        public string Gender { get; set; } = string.Empty;
        [Column("reward_point")]
        public int RewardPoint { get; set; }
        [Column("created_at")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}