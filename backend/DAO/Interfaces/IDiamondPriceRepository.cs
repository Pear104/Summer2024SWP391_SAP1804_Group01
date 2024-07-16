using backend.BusinessOjects.Models;
using backend.Services.DTOs.DiamondPrice;

namespace backend.Interfaces
{
    public interface IDiamondPriceRepository
    {
        Task<IEnumerable<DiamondPrice>> GetAllDiamondPricesAsync();
        Task<DiamondPrice?> GetDiamondPriceByIdAsync(long id);
        Task<DiamondPrice?> CreateDiamondPriceAsync(CreateDiamondPriceDTO diamondPriceDto);
    }
}
