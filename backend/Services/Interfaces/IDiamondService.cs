using BusinessObjects.Models;
using Helpers.DTOs.Diamond;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface IDiamondService
    {
        Task<DiamondResult> GetAllDiamonds(DiamondQuery query);
        Task<Diamond?> GetDiamondById(long id);
        Task<Diamond?> CreateDiamond(CreateDiamondDTO diamondDTO);
        Task<Diamond?> UpdateDiamond(long id, UpdateDiamondDTO diamondDTO);
        Task<Diamond?> DeleteDiamond(long id, bool isHidden);
    }
}
