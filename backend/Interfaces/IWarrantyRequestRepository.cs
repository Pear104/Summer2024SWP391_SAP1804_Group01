using backend.DTOs.WarrantyRequest;
using backend.Models;

namespace backend.Interfaces
{
    public interface IWarrantyRequestRepository
    {
        Task<IEnumerable<WarrantyRequest>> GetAllWarrantyRequestsAsync();
        Task<WarrantyRequest?> GetWarrantyRequestByIdAsync(long id);
        Task<WarrantyRequest?> CreateWarrantyRequestAsync(
            long customerId,
            CreateWarrantyRequestDTO warrantyRequestDto
        );
        Task<WarrantyRequest?> UpdateWarrantyRequestAsync(
            long id,
            UpdateWarrantyRequestDTO warrantyRequestDto
        );
        Task<WarrantyRequest?> DeleteWarrantyRequestAsync(long id);
    }
}
