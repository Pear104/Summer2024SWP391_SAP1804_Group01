using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs;
using backend.Models;
using backend.Mappers;

namespace backend.Mappers
{
    public static class AccountMappers
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
                Gender = account.Gender,
                CreatedAt = account.CreatedAt,
                OrdersOfCustomer = account.OrdersOfCustomer.Select(order => order.ToOrderDTO()).ToList(),
                OrdersOfSaleStaff = account.OrdersOfSaleStaff.Select(order => order.ToOrderDTO()).ToList(),
                OrdersOfDeliveryStaff = account.OrdersOfDeliveryStaff.Select(order => order.ToOrderDTO()).ToList(),
                Rank = account.Rank.ToRankDTO(),
                Role = account.Role.ToRoleDTO(),
                RewardPoint = account.RewardPoint
            };
        }

        public static Account ToAccount(this AccountDTO accountDTO)
        {
            return new Account
            {
                Name = accountDTO.Name,
                Email = accountDTO.Email,
                Password = accountDTO.Password,
                PhoneNumber = accountDTO.PhoneNumber,
                Address = accountDTO.Address,
                Birthday = accountDTO.Birthday,
                Gender = accountDTO.Gender,
                CreatedAt = accountDTO.CreatedAt,
                OrdersOfCustomer = accountDTO.OrdersOfCustomer.Select(order => order.ToOrderDTO()).ToList(),
                OrdersOfSaleStaff = accountDTO.OrdersOfSaleStaff.Select(order => order.ToOrderDTO()).ToList(),
                OrdersOfDeliveryStaff = accountDTO.OrdersOfDeliveryStaff.Select(order => order.ToOrderDTO()).ToList(),
                RewardPoint = accountDTO.RewardPoint
            };
        }
    }
}