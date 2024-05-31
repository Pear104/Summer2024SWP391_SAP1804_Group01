using System.Collections.Generic;
using System.Threading.Tasks;
using backend.Helper;
using backend.Models;

namespace backend.Interfaces
{
    public interface IAccessoryRepository
    {
        Task<IEnumerable<Accessory>> GetAllAccessoriesAsync(AccessoryQuery query);
        Task<Accessory?> GetAccessoryByIdAsync(long id);
        Task<Accessory> CreateAccessoryAsync(Accessory accessory);
        Task<Accessory?> UpdateAccessoryAsync(long id, Accessory accessory);
        Task<Accessory?> DeleteAccessoryAsync(long id);
    }
}