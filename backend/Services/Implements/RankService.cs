using BusinessObjects.Models;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class RankService : IRankService
    {
        private readonly IRankRepository _rankRepository;

        public RankService(IRankRepository rankRepository)
        {
            _rankRepository = rankRepository;
        }

        public Task<Rank> CreateRank(Rank rank)
        {
            return _rankRepository.CreateRankAsync(rank);
        }

        public Task<Rank?> DeleteRank(long id)
        {
            return _rankRepository.DeleteRankAsync(id);
        }

        public Task<IEnumerable<Rank>> GetAllRanks()
        {
            return _rankRepository.GetAllRanksAsync();
        }

        public Task<Rank?> GetRankById(long id)
        {
            return _rankRepository.GetRankByIdAsync(id);
        }

        public Task<Rank?> UpdateRank(long id, Rank rank)
        {
            return _rankRepository.UpdateRankAsync(id, rank);
        }
    }
}
