using BusinessObjects.Models.Payment.Domain.Entities;
using DAOs;
using Helpers.DTOs.Merchant;
using Helpers.Mappers;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces.Payments;

namespace Repositories.Implements
{
    public class MerchantRepository : IMerchantRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public MerchantRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<MerchantDto>? Create(Merchant merchant)
        {
            await _dbContext.Merchants.AddAsync(merchant);
            await _dbContext.SaveChangesAsync();
            return merchant.ToMerchantDtoFromMerchant();
        }

        public async Task<Merchant>? Delete(string id)
        {
            var merchantModel = await _dbContext.Merchants.FirstOrDefaultAsync(m =>
                m.Id.ToLower().Equals(id.ToLower())
            );
            if (merchantModel != null)
            {
                _dbContext.Merchants.Remove(merchantModel);
                await _dbContext.SaveChangesAsync();
                return merchantModel;
            }
            return null;
        }

        public async Task<List<Merchant>> GetAll()
        {
            return await _dbContext.Merchants.ToListAsync();
        }

        public async Task<List<Merchant>>? GetByCriteria(string criteria)
        {
            if (string.IsNullOrWhiteSpace(criteria))
            {
                return null;
            }
            var merchantList = await _dbContext
                .Merchants.Where(m => m.MerchantName.Contains(criteria.Trim()))
                .ToListAsync();
            return merchantList;
        }

        public async Task<Merchant>? GetById(string id)
        {
            var merchantModel = await _dbContext.Merchants.FirstOrDefaultAsync(m =>
                m.Id.ToLower().Equals(id.ToLower())
            );
            if (merchantModel != null)
            {
                return merchantModel;
            }
            return null;
        }

        public Task<Merchant>? Update(string id)
        {
            throw new NotImplementedException();
        }
    }
}
