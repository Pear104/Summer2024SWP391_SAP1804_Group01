using backend.Services.DTOs.WarrantyCard;
using backend.Services.QueriesHelper;

namespace backend.Interfaces
{
    public interface IWarrantyCardRepository
    {
        Task<WarrantyCardResult?> getWarrantyCards(WarrantyCardQuery query);
        Task<WarrantyCardResult?> getUserWarrantyCards(WarrantyCardQuery query);
    }
}
