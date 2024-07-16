using backend.DTOs.Order;
using backend.DTOs.WarrantyRequest;
using backend.Helper;
using backend.Models;

namespace backend.Interfaces
{
    public interface IWarrantyRequestRepository
    {
        Task<WarrantyRequestResult> GetAllWarrantyRequestsAsync(WarrantyRequestQuery query);
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
