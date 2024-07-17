using BusinessObjects.Models;
using Helpers.DTOs.AccessoryType;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class AccessoryTypeService : IAccessoryTypeService
    {
        private readonly IAccessoryTypeRepository _accessoryTypeRepository;

        public AccessoryTypeService(IAccessoryTypeRepository accessoryTypeRepository)
        {
            _accessoryTypeRepository = accessoryTypeRepository;
        }

        public Task<AccessoryType?> CreateAccessoryType(CreateAccessoryTypeDTO accessoryTypeDto)
        {
            return _accessoryTypeRepository.CreateAccessoryTypeAsync(accessoryTypeDto);
        }

        public Task<AccessoryType?> DeleteAccessoryType(long id)
        {
            return _accessoryTypeRepository.DeleteAccessoryTypeAsync(id);
        }

        public Task<AccessoryType?> GetAccessoryTypeById(long id)
        {
            return _accessoryTypeRepository.GetAccessoryTypeByIdAsync(id);
        }

        public Task<IEnumerable<AccessoryType>> GetAllAccessoryTypes()
        {
            return _accessoryTypeRepository.GetAllAccessoryTypesAsync();
        }

        public Task<AccessoryType?> UpdateAccessoryType(
            long id,
            UpdateAccessoryTypeDTO accessoryTypeDto
        )
        {
            return _accessoryTypeRepository.UpdateAccessoryTypeAsync(id, accessoryTypeDto);
        }
    }
}
