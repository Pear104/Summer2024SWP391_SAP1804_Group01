using backend.BusinessOjects.Models;
using backend.Services.DTOs.Order;
using backend.Services.DTOs.WarrantyRequest;
using backend.Services.QueriesHelper;

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
