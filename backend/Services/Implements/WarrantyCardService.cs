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

        public Task<WarrantyCardResult?> getUserWarrantyCards(WarrantyCardQuery query)
        {
            return _warrantyCardRepository.getUserWarrantyCards(query);
        }

        public Task<WarrantyCardResult?> getWarrantyCards(WarrantyCardQuery query)
        {
            return _warrantyCardRepository.getWarrantyCards(query);
        }
    }
}
