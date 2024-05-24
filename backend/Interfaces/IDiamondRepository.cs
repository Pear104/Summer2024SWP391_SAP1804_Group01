using System.Collections.Generic;
using System.Threading.Tasks;
using backend.Models;

namespace backend.Interfaces
{
    public interface IDiamondRepository
    {
        Task<IEnumerable<Diamond>> GetAllDiamondsAsync();
        Task<Diamond> GetDiamondByIdAsync(long id);
        Task<Diamond> CreateDiamondAsync(Diamond diamond);
        Task<Diamond> UpdateDiamondAsync(Diamond diamond);
        Task DeleteDiamondAsync(long id);
    }
}