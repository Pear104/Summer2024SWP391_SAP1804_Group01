using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs
{
    public class RankDTO
    {
        public long RankId { get; set; }
        public string RankName { get; set; } = string.Empty;
        public float Discount { get; set; }
        public int RewardPoint { get; set; }
        public List<AccountDTO> Accounts { get; set; } = new List<AccountDTO>();
    }
}