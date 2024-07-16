using backend.BusinessOjects.Enums;
using backend.BusinessOjects.Models;
using backend.Services.DTOs.Account;

namespace backend.Services.Mappers
{
    public static class AccountMapper
    {
        public static AccountDTO ToAccountDTO(this Account account)
        {
            return new AccountDTO
            {
                AccountId = account.AccountId,
                Name = account.Name,
                Email = account.Email,
                PhoneNumber = account.PhoneNumber,
                Address = account.Address,
                Birthday = account.Birthday,
                Gender = account.Gender.ToString(),
                CreatedAt = account.CreatedAt,
                OrdersOfCustomer = account
                    .OrdersOfCustomer.Select(order => order.ToOrderDTO())
                    .ToList(),
                OrdersOfSaleStaff = account
                    .OrdersOfSaleStaff.Select(order => order.ToOrderDTO())
                    .ToList(),
                OrdersOfDeliveryStaff = account
                    .OrdersOfDeliveryStaff.Select(order => order.ToOrderDTO())
                    .ToList(),
                WarrantyRequestsOfCustomer = account
                    .WarrantyRequestsOfCustomer.Select(warrantyRequest =>
                        warrantyRequest.ToWarrantyRequestDTO()
                    )
                    .ToList(),
                WarrantyRequestsOfWarrantyStaff = account
                    .WarrantyRequestsOfWarrantyStaff.Select(warrantyRequest =>
                        warrantyRequest.ToWarrantyRequestDTO()
                    )
                    .ToList(),
                WarrantyRequestsOfDeliveryStaff = account
                    .WarrantyRequestsOfDeliveryStaff.Select(warrantyRequest =>
                        warrantyRequest.ToWarrantyRequestDTO()
                    )
                    .ToList(),
                Rank = account.Rank.ToRankDTO(),
                Role = account.Role.ToString(),
                RewardPoint = account.RewardPoint
            };
        }

        public static Account ToAccount(this AccountDTO accountDTO)
        {
            return new Account
            {
                Name = accountDTO.Name,
                Email = accountDTO.Email,
                PhoneNumber = accountDTO.PhoneNumber,
                Address = accountDTO.Address,
                Birthday = accountDTO.Birthday,
                Gender = (Gender)Enum.Parse(typeof(Gender), accountDTO.Gender),
                CreatedAt = accountDTO.CreatedAt,
                RewardPoint = accountDTO.RewardPoint
            };
        }

        public static Account ToUpdateAccountDTO(this UpdateAccountDTO accountDTO)
        {
            return new Account
            {
                Name = accountDTO.Name,
                PhoneNumber = accountDTO.PhoneNumber,
                Address = accountDTO.Address,
                Birthday = accountDTO.Birthday,
                Gender = (Gender)Enum.Parse(typeof(Gender), accountDTO.Gender),
            };
        }
    }
}
