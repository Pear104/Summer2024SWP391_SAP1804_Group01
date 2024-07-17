using BusinessObjects.Models;
using Helpers.DTOs.DiamondPrice;

namespace Services.Interfaces
{
    public interface IDiamondPriceService
    {
        Task<IEnumerable<DiamondPrice>> GetAllDiamondPrices();
        Task<DiamondPrice?> GetDiamondPriceById(long id);
        Task<DiamondPrice?> CreateDiamondPrice(CreateDiamondPriceDTO diamondPriceDto);
    }
}
