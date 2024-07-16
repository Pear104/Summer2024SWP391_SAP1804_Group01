
using BusinessObjects.Models.Payment.Domain.Entities;
using Helpers.DTOs.Merchant;

namespace Helpers.Mappers
{
    public static class MerchantMapper
    {
        public static Merchant ToMerchantFromCreateMerchant(this CreateMerchantDto createMerchant)
        {
            var merchant = new Merchant()
            {
                MerchantName = createMerchant.MerchantName,
                MerchantWebLink = createMerchant.MerchantWebLink,
                MerchantIpnUrl = createMerchant.MerchentIpnUrl,
                MerchantReturnUrl = createMerchant.MerchantReturnUrl,
                IsActive = createMerchant.IsActive
            };
            return merchant;
        }

        public static MerchantDto ToMerchantDtoFromMerchant(this Merchant merchantModel)
        {
            var dto = new MerchantDto()
            {
                MerchantName = merchantModel.MerchantName,
                MerchantWebLink = merchantModel.MerchantWebLink,
                MerchentIpnUrl = merchantModel.MerchantIpnUrl,
                MerchantReturnUrl = merchantModel.MerchantReturnUrl,
                IsActive = merchantModel.IsActive
            };
            return dto;
        }
    }
}
