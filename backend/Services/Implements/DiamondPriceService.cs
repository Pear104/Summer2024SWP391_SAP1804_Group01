using BusinessObjects.Models;
using Helpers.DTOs.DiamondPrice;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class DiamondPriceService : IDiamondPriceService
    {
        private readonly IDiamondPriceRepository _diamondPriceRepository;

        public DiamondPriceService(IDiamondPriceRepository diamondPriceRepository)
        {
            _diamondPriceRepository = diamondPriceRepository;
        }

        public Task<DiamondPrice?> CreateDiamondPrice(CreateDiamondPriceDTO diamondPriceDto)
        {
            return _diamondPriceRepository.CreateDiamondPriceAsync(diamondPriceDto);
        }

        public Task<IEnumerable<DiamondPrice>> GetAllDiamondPrices()
        {
            return _diamondPriceRepository.GetAllDiamondPricesAsync();
        }

        public Task<DiamondPrice?> GetDiamondPriceById(long id)
        {
            return _diamondPriceRepository.GetDiamondPriceByIdAsync(id);
        }
    }
}
