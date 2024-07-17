using BusinessObjects.Models;
using Helpers.DTOs.WarrantyRequest;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface IWarrantyRequestService
    {
        Task<WarrantyRequestResult> GetAllWarrantyRequests(WarrantyRequestQuery query);
        Task<WarrantyRequest?> GetWarrantyRequestById(long id);
        Task<WarrantyRequest?> CreateWarrantyRequest(
            long customerId,
            CreateWarrantyRequestDTO warrantyRequestDto
        );
        Task<WarrantyRequest?> UpdateWarrantyRequest(
            long id,
            UpdateWarrantyRequestDTO warrantyRequestDto
        );
        Task<WarrantyRequest?> DeleteWarrantyRequest(long id);
    }
}
