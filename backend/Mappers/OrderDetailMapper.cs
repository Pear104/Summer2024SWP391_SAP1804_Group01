using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs;
using backend.Models;

namespace backend.Mappers
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
                Diamond = orderDetail.Diamond.ToDiamondDTO(),
                Accessory = orderDetail.Accessory.ToAccessoryDTO(),
                ItemPrice = orderDetail.ItemPrice,
                DiamondPrice = orderDetail.DiamondPrice.ToDiamondPriceDTO(),
                MaterialPrice = orderDetail.MaterialPrice.ToMaterialPriceDTO()
            };
        }

    }
}