using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.WarrantyRequest;
using backend.Models;

namespace backend.Mappers
{
    public static class WarrantyRequestMapper
    {
        public static WarrantyRequestDTO ToWarrantyRequestDTO(this WarrantyRequest warrantyRequest)
        {
            var diamond = warrantyRequest.WarrantyCard.OrderDetail.Diamond;
            var productName =
                $"{diamond.Carat} ct {diamond.Shape.Name} Shape Diamond #{diamond.CertificateNumber}"
                + (
                    warrantyRequest.WarrantyCard.OrderDetail?.Accessory?.Name != null
                        ? ($" + {warrantyRequest.WarrantyCard.OrderDetail.Accessory.Name}")
                        : ""
                );
            return new WarrantyRequestDTO
            {
                WarrantyRequestId = warrantyRequest.WarrantyRequestId,
                Product = productName,
                WarrantyReason = warrantyRequest.WarrantyReason,
                CustomerId = warrantyRequest.CustomerId,
                CustomerName = warrantyRequest.Customer.Name,
                SaleStaffId = warrantyRequest.SaleStaffId ?? 0,
                SaleStaffName = warrantyRequest.SaleStaff?.Name,
                DeliveryStaffId = warrantyRequest.DeliveryStaffId ?? 0,
                DeliveryStaffName = warrantyRequest.DeliveryStaff?.Name,
                WarrantyCardId = warrantyRequest.WarrantyCardId,
                ReceiveTime = warrantyRequest.ReceiveTime,
                ReturnTime = warrantyRequest.ReturnTime ?? null,
                WarrantyStatus = warrantyRequest.WarrantyStatus.ToString(),
                ShippingAddress = warrantyRequest.ShippingAddress,
                PhoneNumber = warrantyRequest.PhoneNumber
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
