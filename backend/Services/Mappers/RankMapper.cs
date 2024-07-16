using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.DTOs.Rank;
using backend.BusinessOjects.Models;

namespace backend.Services.Mappers
{
    public static class RankMapper
    {
        public static Rank ToRankFromCreate(this CreateRankDTO rank)
        {
            return new Rank
            {
                RankName = rank.RankName,
                Discount = rank.Discount,
                RewardPoint = rank.RewardPoint
            };
        }

        public static Rank ToRankFromUpdate(this UpdateRankDTO rank, long rankId)
        {
            return new Rank
            {
                RankId = rankId,
                RankName = rank.RankName,
                Discount = rank.Discount,
                RewardPoint = rank.RewardPoint
            };
        }

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
                Discount = rankDTO.Discount,
                RewardPoint = rankDTO.RewardPoint
            };
        }
    }
}
