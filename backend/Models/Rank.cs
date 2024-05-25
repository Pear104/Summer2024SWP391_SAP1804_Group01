using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace backend.Models
{
    [Table("rank")]
    public class Rank
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("rank_id")]
        public long RankId { get; set; }
        [Column("rank_name")]
        public string RankName { get; set; } = string.Empty;
        [Column("discount")]
        public float Discount { get; set; }
        [Column("reward_point")]
        public int RewardPoint { get; set; }
        public List<Account> Accounts { get; set; } = new List<Account>();

    }
}