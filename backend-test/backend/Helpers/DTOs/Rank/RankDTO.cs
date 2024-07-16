
namespace Helpers.DTOs.Rank
{
    public class RankDTO
    {
        public long RankId { get; set; }
        public string RankName { get; set; } = string.Empty;
        public float Discount { get; set; }
        public int RewardPoint { get; set; }
    }
}
