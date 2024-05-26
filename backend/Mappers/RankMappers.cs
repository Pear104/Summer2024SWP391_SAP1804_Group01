using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Rank;
using backend.Models;

namespace backend.Mappers
{
    public static class RankMappers
    {
        public static RankDTO ToRankDTO(this Rank rank) 
        {
            return new RankDTO
            {
                RankId = rank.RankId,
                RankName = rank.RankName,
                Discount = rank.Discount,
                RewardPoint = rank.RewardPoint
            };
        }

        public static Rank ToRank(this RankDTO rankDTO) 
        {
            return new Rank
            {
                RankId = rankDTO.RankId,
                RankName = rankDTO.RankName,
                RewardPoint = rankDTO.RewardPoint
            };
        }
    }
}