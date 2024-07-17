using BusinessObjects.Models;
using Helpers.DTOs.Accessory;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class AccessoryService : IAccessoryService
    {
        private readonly IAccessoryRepository _accessoryRepository;

        public AccessoryService(IAccessoryRepository accessoryRepository)
        {
            _accessoryRepository = accessoryRepository;
        }

        public Task<Accessory?> CreateAccessory(CreateAccessoryDTO accessoryDto)
        {
            return _accessoryRepository.CreateAccessoryAsync(accessoryDto);
        }

        public Task<Accessory?> DeleteAccessory(long id, bool isHidden)
        {
            return _accessoryRepository.DeleteAccessoryAsync(id, isHidden);
        }

        public Task<AccessoryResult> GetAllAccessories(AccessoryQuery query)
        {
            return _accessoryRepository.GetAllAccessoriesAsync(query);
        }

        public Task<Accessory?> GetAccessoryById(long id)
        {
            return _accessoryRepository.GetAccessoryByIdAsync(id);
        }

        public Task<Accessory?> UpdateAccessory(long id, UpdateAccessoryDTO accessoryDto)
        {
            return _accessoryRepository.UpdateAccessoryAsync(id, accessoryDto);
        }
    }
}
