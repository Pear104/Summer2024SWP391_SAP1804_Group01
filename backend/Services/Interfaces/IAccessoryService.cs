using BusinessObjects.Models;
using Helpers.DTOs.Accessory;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface IAccessoryService
    {
        Task<AccessoryResult> GetAllAccessories(AccessoryQuery query);
        Task<Accessory?> GetAccessoryById(long id);
        Task<Accessory?> CreateAccessory(CreateAccessoryDTO accessoryDto);
        Task<Accessory?> UpdateAccessory(long id, UpdateAccessoryDTO accessoryDto);
        Task<Accessory?> DeleteAccessory(long id, bool isHidden);
    }
}
