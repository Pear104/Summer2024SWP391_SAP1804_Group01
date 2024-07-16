using backend.BusinessOjects.Models;
using backend.Services.DTOs.Diamond;
using backend.Services.QueriesHelper;

namespace backend.Interfaces
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
