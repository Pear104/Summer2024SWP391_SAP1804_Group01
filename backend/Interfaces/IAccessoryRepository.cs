using System.Collections.Generic;
using System.Threading.Tasks;
using backend.Models;

namespace backend.Interfaces
{
    public interface IAccessoryRepository
    {
        Task<IEnumerable<Accessory>> GetAllAccessorysAsync();
        Task<Accessory> GetAccessoryByIdAsync(long id);
        Task<Accessory> CreateAccessoryAsync(Accessory accessory);
        Task<Accessory> UpdateAccessoryAsync(Accessory accessory);
        Task DeleteAccessoryAsync(long id);
    }
}