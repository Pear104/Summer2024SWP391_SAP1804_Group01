using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs.Rank
{
    public class CreateRankDTO
    {
        public string RankName { get; set; } = string.Empty;
        public float Discount { get; set; }
        public int RewardPoint { get; set; }
    }
}
