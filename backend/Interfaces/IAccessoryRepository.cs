using System.Collections.Generic;
using System.Threading.Tasks;
using backend.DTOs.Accessory;
using backend.Helper;
using backend.Models;

namespace backend.Interfaces
{
    public interface IAccessoryRepository
    {
        Task<AccessoryResult> GetAllAccessoriesAsync(AccessoryQuery query);
        Task<Accessory?> GetAccessoryByIdAsync(long id);
        Task<Accessory?> CreateAccessoryAsync(CreateAccessoryDTO accessoryDto);
        Task<Accessory?> UpdateAccessoryAsync(long id, UpdateAccessoryDTO accessoryDto);
        Task<Accessory?> DeleteAccessoryAsync(long id);
    }
}
