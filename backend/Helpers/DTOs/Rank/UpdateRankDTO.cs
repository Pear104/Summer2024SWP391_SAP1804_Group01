using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Rank
{
    public class UpdateRankDTO
    {
        public string RankName { get; set; } = string.Empty;
        public float Discount { get; set; }
        public int RewardPoint { get; set; }
    }
}
