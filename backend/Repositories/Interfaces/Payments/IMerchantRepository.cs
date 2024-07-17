
using BusinessObjects.Models.Payment.Domain.Entities;
using Helpers.DTOs.Merchant;

namespace Repositories.Interfaces.Payments
{
    public interface IMerchantRepository
    {
        public Task<List<Merchant>> GetAll();
        public Task<List<Merchant>>? GetByCriteria(string criteria);
        public Task<Merchant>? GetById(string id);
        public Task<MerchantDto>? Create(Merchant merchant);
        public Task<Merchant>? Update(string id);
        public Task<Merchant>? Delete(string id);
    }
}
