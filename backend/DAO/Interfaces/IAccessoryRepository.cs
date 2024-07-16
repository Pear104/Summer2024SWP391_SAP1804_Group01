using System.Collections.Generic;
using System.Threading.Tasks;
using backend.Services.DTOs.Accessory;
using backend.Services.Helper;
using backend.Models;

namespace backend.DAO.Interfaces
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
