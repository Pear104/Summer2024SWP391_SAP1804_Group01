using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Models
{
    [Table("rank")]
    public class Rank
    {
        [Column("rank_id")]
        public long RankId { get; set; }
        [Column("rank_name")]
        public string RankName { get; set; } = string.Empty;
        [Column("discount")]
        public float Discount { get; set; }
        [Column("reward_point")]
        public int RewardPoint { get; set; }
        
    }
}