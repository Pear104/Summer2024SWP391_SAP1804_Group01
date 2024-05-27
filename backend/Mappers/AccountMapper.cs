using backend.DTOs.Account;
using backend.Enums;
using backend.Models;

namespace backend.Mappers
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
    }
}
