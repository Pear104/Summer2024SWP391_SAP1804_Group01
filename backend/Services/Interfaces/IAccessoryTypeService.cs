using BusinessObjects.Models;
using Helpers.DTOs.AccessoryType;

namespace Services.Interfaces
{
    public interface IAccessoryTypeService
    {
        Task<IEnumerable<AccessoryType>> GetAllAccessoryTypes();
        Task<AccessoryType?> GetAccessoryTypeById(long id);
        Task<AccessoryType?> CreateAccessoryType(CreateAccessoryTypeDTO accessoryTypeDto);
        Task<AccessoryType?> UpdateAccessoryType(long id, UpdateAccessoryTypeDTO accessoryTypeDto);
        Task<AccessoryType?> DeleteAccessoryType(long id);
    }
}
