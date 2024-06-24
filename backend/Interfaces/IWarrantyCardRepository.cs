using backend.DTOs.WarrantyCard;
using backend.Helper;
using Microsoft.AspNetCore.Mvc;

namespace backend.Interfaces
{
    public interface IWarrantyCardRepository
    {
        Task<WarrantyCardResult?> getWarrantyCards(WarrantyCardQuery query);
    }
}
