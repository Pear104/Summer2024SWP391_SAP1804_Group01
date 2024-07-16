
using BusinessObjects.Models;
using Helpers.DTOs.MaterialPrice;

namespace Repositories.Interfaces
{
    public interface IMaterialPriceRepository
    {
        Task<IEnumerable<MaterialPrice>> GetAllMaterialPricesAsync();
        Task<MaterialPrice?> GetMaterialPriceByIdAsync(long id);
        Task<MaterialPrice?> CreateMaterialPriceAsync(CreateMaterialPriceDTO materialPriceDto);
    }
}
