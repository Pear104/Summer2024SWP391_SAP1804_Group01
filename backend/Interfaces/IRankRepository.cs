using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Models;

namespace backend.Interfaces
{
    public interface IRankRepository
    {
        Task<IEnumerable<Rank>> GetAllRanksAsync();
        Task<Rank> GetRankByIdAsync(long id);
        Task<Rank> CreateRankAsync(Rank rank);
        Task<Rank> UpdateRankAsync(Rank rank);
        Task DeleteRankAsync(long id);
    }
}