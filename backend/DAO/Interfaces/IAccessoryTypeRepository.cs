using backend.BusinessOjects.Models;
using backend.Services.DTOs.AccessoryType;

namespace backend.Interfaces
{
    public interface IAccessoryTypeRepository
    {
        Task<IEnumerable<AccessoryType>> GetAllAccessoryTypesAsync();
        Task<AccessoryType?> GetAccessoryTypeByIdAsync(long id);
        Task<AccessoryType?> CreateAccessoryTypeAsync(CreateAccessoryTypeDTO accessoryTypeDto);
        Task<AccessoryType?> UpdateAccessoryTypeAsync(
            long id,
            UpdateAccessoryTypeDTO accessoryTypeDto
        );
        Task<AccessoryType?> DeleteAccessoryTypeAsync(long id);
    }
}
