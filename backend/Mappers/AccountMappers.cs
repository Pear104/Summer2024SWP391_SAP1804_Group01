using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs;
using backend.Models;

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
                Rank = account.Rank.Select(r => r.ToRankDTO()).ToList(),
                Role = account.Role.Select(r => r.ToRoleDTO()).ToList(),
                RewardPoint = account.AccountPoint,
                 = account.AccountStatus
            };
        }
        public static Account ToAccount(this AccountDTO account)
        {
            return new Account
            {
                AccountId = account.AccountId,
                AccountName = account.AccountName,
                AccountPassword = account.AccountPassword,
                AccountEmail = account.AccountEmail,
                AccountPhone = account.AccountPhone,
                AccountAddress = account.AccountAddress,
                AccountRole = account.AccountRole,
                AccountRank = account.AccountRank,
                AccountPoint = account.AccountPoint,
                AccountStatus = account.AccountStatus
            };
        } 
    }
}