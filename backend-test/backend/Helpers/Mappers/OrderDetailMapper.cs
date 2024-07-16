
using BusinessObjects.Models;
using Helpers.DTOs.OrderDetail;

namespace Helpers.Mappers
{
    public static class OrderDetailMapper
    {
        // public static CreateOrderDetailDTO ToCreateOrderDetailDTO(this OrderDetail orderDetail)
        // {
        //     return new CreateOrderDetailDTO
        //     {
        //         Size = orderDetail.Size,
        //         DiamondId =orderDetail.DiamondId,
        //         AccessoryId = orderDetail.AccessoryId
        //     };
        // }
        // public static OrderDetail ToOrderDetailFromCreate(this CreateOrderDetailDTO orderDetailDTO, int orderID)
        // {
        //     return new OrderDetail
        //     {
        //         Size = orderDetailDTO.Size,
        //         DiamondId = orderDetailDTO.DiamondId,
        //         Accessory = (long)orderDetailDTO.Accessory,
        //         OrderId = orderID
        //     };
        // }

        // public static UpdateOrderDetail ToOrderDetailFromUpdate(this OrderDetailDTO orderDetailDTO, int orderID)
        // {
        //     return new OrderDetail
        //     {
        //         Size = orderDetailDTO.Size,
        //         DiamondId = orderDetailDTO.DiamondId,
        //         AccessoryId = (long)orderDetailDTO.AccessoryId,
        //         OrderId = orderID
        //     };
        // }
        public static OrderDetailDTO ToOrderDetailDTO(this OrderDetail orderDetail)
        {
            return new OrderDetailDTO
            {
                OrderDetailId = orderDetail.OrderDetailId,
                OrderId = orderDetail.OrderId,
                Size = orderDetail.Size,
                Diamond = orderDetail.Diamond != null ? orderDetail.Diamond.ToDiamondDTO() : null,
                Accessory =
                    orderDetail.Accessory != null ? orderDetail.Accessory.ToAccessoryDTO() : null,
                DiamondPrice =
                    orderDetail.DiamondPrice != null
                        ? orderDetail.DiamondPrice.ToDiamondPriceDTO()
                        : null,
                MaterialPrice =
                    orderDetail.MaterialPrice != null
                        ? orderDetail.MaterialPrice.ToMaterialPriceDTO()
                        : null,
                WarrantyCards = orderDetail
                    .WarrantyCards.Select(x => x.ToWarrantyCardDTO())
                    .ToList(),
            };
        }
    }
}
