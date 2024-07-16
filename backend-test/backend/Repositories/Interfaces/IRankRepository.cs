
using BusinessObjects.Models;

namespace Repositories.Interfaces
{
    public interface IRankRepository
    {
        Task<IEnumerable<Rank>> GetAllRanksAsync();
        Task<Rank?> GetRankByIdAsync(long id);
        Task<Rank> CreateRankAsync(Rank rank);
        Task<Rank?> UpdateRankAsync(long id, Rank rank);
        Task<Rank?> DeleteRankAsync(long id);
    }
}
