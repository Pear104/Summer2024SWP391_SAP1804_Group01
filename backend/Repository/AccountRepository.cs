using System.Collections.Generic;
using backend.Data;
using backend.DTOs.Account;
using backend.Enums;
using backend.Helper;
using backend.Interfaces;
using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Repository
{
    public class AccountRepository : IAccountRepository
    {
        private readonly ApplicationDbContext _context;

        public AccountRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public bool AccountExisted(long id)
        {
            return _context.Accounts.Any(e => e.AccountId == id);
        }

        public async Task<Account> CreateAccountAsync(Account account)
        {
            await _context.Accounts.AddAsync(account);
            await _context.SaveChangesAsync();
            return account;
        }

        //delete account xem xet
        public async Task<Account?> DeleteAccountAsync(long id, bool isDisable)
        {
            var model = await _context.Accounts.FirstOrDefaultAsync(x => x.AccountId == id);
            if (model != null)
            {
                model.IsDisable = isDisable;
                _context.Entry(model).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return model;
            }
            return null;
        }

        public async Task<Account?> GetAccountByIdAsync(long id)
        {
            return await _context
                .Accounts.Include(x => x.Rank)
                // .Include(x => x.OrdersOfCustomer)
                .Include(x => x.OrdersOfSaleStaff)
                .Include(x => x.OrdersOfDeliveryStaff)
                .FirstOrDefaultAsync(x => x.AccountId == id);
        }

        public async Task<Account?> GetCustomerByIdAsync(long id)
        {
            var customersModel = _context.Accounts.Where(c => c.Role == Role.Customer);
            return await customersModel
                .Include(x => x.Rank)
                .FirstOrDefaultAsync(x => x.AccountId == id);
        }

        public async Task<Account?> UpdateAccountAsync(long id, UpdateAccountDTO accountDto)
        {
            var existedAccount = await _context.Accounts.FindAsync(id);
            if (existedAccount == null)
            {
                return null;
            }
            existedAccount.Name = accountDto.Name;
            existedAccount.Address = accountDto.Address;
            existedAccount.Birthday = accountDto.Birthday;
            existedAccount.Gender = (Gender)Enum.Parse(typeof(Gender), accountDto.Gender);
            existedAccount.PhoneNumber = accountDto.PhoneNumber;
            _context.Entry(existedAccount).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existedAccount;
        }

        public async Task<Account?> UpdatePasswordAsync(
            long id,
            UpdatePasswordAccountDTO accountDto
        )
        {
            var existedAccount = await _context.Accounts.FindAsync(id);
            if (existedAccount == null)
            {
                return null;
            }
            bool checkPass = PasswordHasher.VerifyPassword(
                accountDto.CurPassword,
                existedAccount.Password
            );
            if (!checkPass)
            {
                return null;
            }
            existedAccount.Password = PasswordHasher.HashPassword(accountDto.Password);
            _context.Entry(existedAccount).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existedAccount;
        }

        public async Task<IEnumerable<Account>> GetAllAccountsAsync(AccountQuery query)
        {
            var accountsQuery = _context
                .Accounts
                // .Include(x => x.Rank)
                // .Include(x => x.OrdersOfSaleStaff)
                // .Include(x => x.OrdersOfDeliveryStaff)
                // .Include(x => x.OrdersOfCustomer)
                .OrderBy(x => x.AccountId)
                .AsSplitQuery()
                .AsQueryable();
            if (!string.IsNullOrEmpty(query.Role))
            {
                var role = Enum.Parse<Role>(query.Role);
                accountsQuery = accountsQuery.Where(x => x.Role == role);
            }
            accountsQuery = accountsQuery
                .Include(x => x.Rank)
                .Include(x => x.OrdersOfSaleStaff)
                .Include(x => x.OrdersOfDeliveryStaff)
                .Include(x => x.OrdersOfCustomer);
            return await accountsQuery
                .Skip((query.PageNumber - 1) * query.PageSize)
                .Take(query.PageSize)
                .ToListAsync();
        }

        public async Task<ListWithPagingDTO<Account>> SearchAccountOnRole(
            AccountSearchQuery accountQuery
        )
        {
            ListWithPagingDTO<Account> result;
            var accountsQuery = _context.Accounts.AsQueryable();
            if (!string.IsNullOrEmpty(accountQuery.GetRole()))
            {
                var role = Enum.Parse<Role>(accountQuery.GetRole());
                accountsQuery = accountsQuery.Where(x => x.Role == role);
            }
            accountsQuery = accountsQuery.Where(x =>
                x.Name.Contains(accountQuery.AccountName)
                && x.PhoneNumber.Contains(accountQuery.AccountPhoneNumber)
            );
            var totalCount = accountsQuery.Count();
            var accountsModel = await accountsQuery
                .Skip((accountQuery.pageNumber - 1) * accountQuery.PageSize)
                .Take(accountQuery.PageSize)
                .ToListAsync();
            result = new()
            {
                Content = accountsModel,
                CurrentPage = accountQuery.pageNumber,
                PageSize = accountQuery.PageSize,
                TotalCount = totalCount,
                TotalPages = (int)Math.Ceiling((totalCount) / (double)accountQuery.PageSize)
            };
            return result;
        }

        public async Task<Account?> GetAccountByEmailAsync(string email)
        {
            return await _context.Accounts.FirstOrDefaultAsync(x => x.Email == email);
        }
    }
}
