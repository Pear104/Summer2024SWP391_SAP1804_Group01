using Helpers.DTOs.WarrantyCard;
using Helpers.Queries;

namespace Repositories.Interfaces
{
    public interface IWarrantyCardRepository
    {
        Task<WarrantyCardResult?> getWarrantyCards(WarrantyCardQuery query);
        Task<List<WarrantyCardDTO>?> getUserWarrantyCards(long accountId);
    }
}
