using BusinessObjects.Models;
using Helpers.DTOs.WarrantyCard;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface IWarrantyCardService
    {
        Task<WarrantyCardResult> getWarrantyCards(WarrantyCardQuery query);
        Task<List<WarrantyCardDTO>?> getUserWarrantyCards(long accountId);
    }
}
