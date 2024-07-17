using BusinessObjects.Models;

namespace Services.Interfaces
{
    public interface IRankService
    {
        Task<IEnumerable<Rank>> GetAllRanks();
        Task<Rank?> GetRankById(long id);
        Task<Rank> CreateRank(Rank rank);
        Task<Rank?> UpdateRank(long id, Rank rank);
        Task<Rank?> DeleteRank(long id);
    }
}
