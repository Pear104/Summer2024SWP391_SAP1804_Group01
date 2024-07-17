
using BusinessObjects.Models;
using Helpers.DTOs.DiamondPrice;

namespace Repositories.Interfaces
{
    public interface IDiamondPriceRepository
    {
        Task<IEnumerable<DiamondPrice>> GetAllDiamondPricesAsync();
        Task<DiamondPrice?> GetDiamondPriceByIdAsync(long id);
        Task<DiamondPrice?> CreateDiamondPriceAsync(CreateDiamondPriceDTO diamondPriceDto);
    }
}
