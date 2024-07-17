
using BusinessObjects.Models;
using Helpers.DTOs.WarrantyRequest;

namespace Helpers.Mappers
{
    public static class WarrantyRequestMapper
    {
        public static WarrantyRequestDTO ToWarrantyRequestDTO(this WarrantyRequest warrantyRequest)
        {
            var diamond = warrantyRequest.WarrantyCard.Diamond;
            var productName =
                diamond != null
                    ? $"{diamond.Carat} ct {diamond.Shape.Name} Shape Diamond #{diamond.CertificateNumber}"
                    : warrantyRequest?.WarrantyCard?.Accessory?.Name;
            return new WarrantyRequestDTO
            {
                WarrantyRequestId = warrantyRequest?.WarrantyRequestId,
                Product = productName,
                WarrantyReason = warrantyRequest?.WarrantyReason,
                CustomerId = warrantyRequest?.CustomerId,
                CustomerName = warrantyRequest?.Customer?.Name,
                WarrantyStaffId = warrantyRequest?.WarrantyStaffId,
                WarrantyStaffName = warrantyRequest?.WarrantyStaff?.Name,
                DeliveryStaffId = warrantyRequest?.DeliveryStaffId,
                DeliveryStaffName = warrantyRequest?.DeliveryStaff?.Name,
                WarrantyCardId = warrantyRequest?.WarrantyCardId,
                ReceiveTime = warrantyRequest?.ReceiveTime,
                ReturnTime = warrantyRequest?.ReturnTime,
                WarrantyStatus = warrantyRequest?.WarrantyStatus.ToString(),
                ShippingAddress = warrantyRequest?.ShippingAddress,
                PhoneNumber = warrantyRequest?.PhoneNumber
            };
        }

        public static WarrantyRequest ToWarrantyRequestFromCreate(
            this CreateWarrantyRequestDTO warrantyRequestDTO
        )
        {
            return new WarrantyRequest()
            {
                PhoneNumber = warrantyRequestDTO.PhoneNumber,
                ShippingAddress = warrantyRequestDTO.ShippingAddress,
                ReceiveTime = warrantyRequestDTO.ReceiveTime,
                WarrantyReason = warrantyRequestDTO.WarrantyReason
            };
        }
    }
}
