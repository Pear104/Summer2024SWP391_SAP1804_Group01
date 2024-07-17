using BusinessObjects.Models;
using DAOs;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class RankRepository : IRankRepository
    {
        private readonly ApplicationDbContext _context;

        public RankRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Rank> CreateRankAsync(Rank rank)
        {
            await _context.Ranks.AddAsync(rank);
            await _context.SaveChangesAsync();
            return rank;
        }

        public async Task<Rank?> DeleteRankAsync(long id)
        {
            var deletedModel = await _context.Ranks.FirstOrDefaultAsync(x => x.RankId == id);
            if (deletedModel != null)
            {
                _context.Ranks.Remove(deletedModel);
                await _context.SaveChangesAsync();
                return deletedModel;
            }
            return null;
        }

        public async Task<IEnumerable<Rank>> GetAllRanksAsync()
        {
            return await _context.Ranks.ToListAsync();
        }

        public async Task<Rank?> GetRankByIdAsync(long id)
        {
            return await _context.Ranks.FirstOrDefaultAsync(x => x.RankId == id);
        }

        public async Task<Rank?> UpdateRankAsync(long id, Rank rank)
        {
            var existingRank = await _context.Ranks.FindAsync(id);
            if (existingRank == null)
            {
                return null;
            }
            existingRank = rank;
            await _context.SaveChangesAsync();
            return existingRank;
        }
    }
}
