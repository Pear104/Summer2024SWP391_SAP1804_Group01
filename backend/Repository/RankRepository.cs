using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Interfaces;
using backend.Models;

namespace backend.Repository
{
    public class RankRepository : IRankRepository
    {
        public Task<Rank> CreateRankAsync(Rank rank)
        {
            throw new NotImplementedException();
        }

        public Task DeleteRankAsync(long id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Rank>> GetAllRanksAsync()
        {
            throw new NotImplementedException();
        }

        public Task<Rank> GetRankByIdAsync(long id)
        {
            throw new NotImplementedException();
        }

        public Task<Rank> UpdateRankAsync(Rank rank)
        {
            throw new NotImplementedException();
        }
    }
}