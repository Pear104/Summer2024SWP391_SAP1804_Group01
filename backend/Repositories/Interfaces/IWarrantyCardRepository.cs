
using Helpers.DTOs.WarrantyCard;
using Helpers.Queries;

namespace Repositories.Interfaces
{
    public interface IWarrantyCardRepository
    {
        Task<WarrantyCardResult?> getWarrantyCards(WarrantyCardQuery query);
        Task<WarrantyCardResult?> getUserWarrantyCards(WarrantyCardQuery query);
    }
}
