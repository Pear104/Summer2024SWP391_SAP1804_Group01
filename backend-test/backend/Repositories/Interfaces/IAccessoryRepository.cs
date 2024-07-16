
using BusinessObjects.Models;
using Helpers.DTOs.Accessory;
using Helpers.Queries;

namespace Repositories.Interfaces
{
    public interface IAccessoryRepository
    {
        Task<AccessoryResult> GetAllAccessoriesAsync(AccessoryQuery query);
        Task<Accessory?> GetAccessoryByIdAsync(long id);
        Task<Accessory?> CreateAccessoryAsync(CreateAccessoryDTO accessoryDto);
        Task<Accessory?> UpdateAccessoryAsync(long id, UpdateAccessoryDTO accessoryDto);
        Task<Accessory?> DeleteAccessoryAsync(long id, bool isHidden);
    }
}
