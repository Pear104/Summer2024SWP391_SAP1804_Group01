
using BusinessObjects.Models;
using Helpers.DTOs.WarrantyRequest;
using Helpers.Queries;

namespace Repositories.Interfaces
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
