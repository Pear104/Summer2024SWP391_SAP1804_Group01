using BusinessObjects.Models;
using Helpers.DTOs.MaterialPrice;

namespace Services.Interfaces
{
    public interface IMaterialPriceService
    {
        Task<IEnumerable<MaterialPrice>> GetAllMaterialPrices();
        Task<MaterialPrice?> GetMaterialPriceById(long id);
        Task<MaterialPrice?> CreateMaterialPrice(CreateMaterialPriceDTO materialPriceDto);
    }
}
