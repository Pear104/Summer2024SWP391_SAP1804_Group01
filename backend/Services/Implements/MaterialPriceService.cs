using BusinessObjects.Models;
using Helpers.DTOs.MaterialPrice;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class MaterialPriceService : IMaterialPriceService
    {
        private readonly IMaterialPriceRepository _materialPriceRepository;

        public MaterialPriceService(IMaterialPriceRepository materialPriceRepository)
        {
            _materialPriceRepository = materialPriceRepository;
        }

        public Task<MaterialPrice?> CreateMaterialPrice(CreateMaterialPriceDTO materialPriceDto)
        {
            return _materialPriceRepository.CreateMaterialPriceAsync(materialPriceDto);
        }

        public Task<IEnumerable<MaterialPrice>> GetAllMaterialPrices()
        {
            return _materialPriceRepository.GetAllMaterialPricesAsync();
        }

        public Task<MaterialPrice?> GetMaterialPriceById(long id)
        {
            return _materialPriceRepository.GetMaterialPriceByIdAsync(id);
        }
    }
}
