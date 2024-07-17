using BusinessObjects.Models;
using Helpers.DTOs.WarrantyRequest;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class WarrantyRequestService : IWarrantyRequestService
    {
        private readonly IWarrantyRequestRepository _warrantyRequestRepository;

        public WarrantyRequestService(IWarrantyRequestRepository warrantyRequestRepository)
        {
            _warrantyRequestRepository = warrantyRequestRepository;
        }

        public Task<WarrantyRequest?> CreateWarrantyRequest(
            long customerId,
            CreateWarrantyRequestDTO warrantyRequestDto
        )
        {
            return _warrantyRequestRepository.CreateWarrantyRequestAsync(
                customerId,
                warrantyRequestDto
            );
        }

        public Task<WarrantyRequest?> DeleteWarrantyRequest(long id)
        {
            return _warrantyRequestRepository.DeleteWarrantyRequestAsync(id);
        }

        public Task<WarrantyRequestResult> GetAllWarrantyRequests(WarrantyRequestQuery query)
        {
            return _warrantyRequestRepository.GetAllWarrantyRequestsAsync(query);
        }

        public Task<WarrantyRequest?> GetWarrantyRequestById(long id)
        {
            return _warrantyRequestRepository.GetWarrantyRequestByIdAsync(id);
        }

        public Task<WarrantyRequest?> UpdateWarrantyRequest(
            long id,
            UpdateWarrantyRequestDTO warrantyRequestDto
        )
        {
            return _warrantyRequestRepository.UpdateWarrantyRequestAsync(id, warrantyRequestDto);
        }
    }
}
