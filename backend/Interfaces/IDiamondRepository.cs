using System.Collections.Generic;
using System.Threading.Tasks;
using backend.DTOs.Diamond;
using backend.Helper;
using backend.Models;

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
