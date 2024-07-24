using Helpers.DTOs.WarrantyCard;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class WarrantyCardService : IWarrantyCardService
    {
        private readonly IWarrantyCardRepository _warrantyCardRepository;

        public WarrantyCardService(IWarrantyCardRepository warrantyCardRepository)
        {
            _warrantyCardRepository = warrantyCardRepository;
        }

        public Task<List<WarrantyCardDTO>?> getUserWarrantyCards(long accountId)
        {
            return _warrantyCardRepository.getUserWarrantyCards(accountId);
        }

        public Task<WarrantyCardResult?> getWarrantyCards(WarrantyCardQuery query)
        {
            return _warrantyCardRepository.getWarrantyCards(query);
        }
    }
}
