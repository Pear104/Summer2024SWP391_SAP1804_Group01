
using BusinessObjects.Models;
using Helpers.DTOs.Diamond;
using Helpers.Queries;

namespace Repositories.Interfaces
{
    public interface IDiamondRepository
    {
        Task<DiamondResult> GetAllDiamondsAsync(DiamondQuery query);
        Task<Diamond?> GetDiamondByIdAsync(long id);
        Task<Diamond?> CreateDiamondAsync(CreateDiamondDTO diamondDTO);
        Task<Diamond?> UpdateDiamondAsync(long id, UpdateDiamondDTO diamondDTO);
        Task<Diamond?> DeleteDiamondAsync(long id, bool isHidden);
    }
}
