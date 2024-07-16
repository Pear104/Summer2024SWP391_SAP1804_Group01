using backend.BusinessOjects.Models;
using backend.Services.DTOs.DiamondPrice;

namespace backend.Interfaces
{
    public interface IMaterialPriceRepository
    {
        Task<IEnumerable<MaterialPrice>> GetAllMaterialPricesAsync();
        Task<MaterialPrice?> GetMaterialPriceByIdAsync(long id);
        Task<MaterialPrice?> CreateMaterialPriceAsync(CreateMaterialPriceDTO materialPriceDto);
    }
}
