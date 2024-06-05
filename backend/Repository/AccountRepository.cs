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
        public async Task DeleteAccountAsync(long id)
        {
            throw new NotImplementedException();
        }

        public async Task<Account?> GetAccountByIdAsync(long id)
        {
            return await _context.Accounts.FindAsync(id);
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

        public async Task<IEnumerable<Account>> GetAllAccountsAsync(AccountQuery query)
        {
            var accountsQuery = _context.Accounts.AsQueryable();
            if (!string.IsNullOrEmpty(query.Role))
            {
                var role = Enum.Parse<Role>(query.Role);
                accountsQuery = accountsQuery.Where(x => x.Role == role);
            }
            return await accountsQuery
                .Skip((query.PageNumber - 1) * query.PageSize)
                .Take(query.PageSize)
                .ToListAsync();
        }

        public async Task<Account?> GetAccountByEmailAsync(string email)
        {
            return await _context.Accounts.FirstOrDefaultAsync(x => x.Email == email);
        }
    }
}
