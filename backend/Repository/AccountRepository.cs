using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.Interfaces;
using backend.Mappers;
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
            return await _context.Accounts
            .Include(x => x.ToAccountDTO())
            .FirstOrDefaultAsync(x => x.AccountId == id);
        }

        public async Task<IEnumerable<Account>> GetAllAccountsAsync()
        {
            return await _context.Accounts
            .Include(x => x.ToAccountDTO())
            .ToListAsync();
        }

        public async Task<Account?> UpdateAccountAsync(long id, Account account)
        {
            var existedAccount = await _context.Accounts.FindAsync(account.AccountId);
            if (existedAccount == null) 
            {
                return null;
            }
            existedAccount = account;
            await _context.SaveChangesAsync();
            return existedAccount;
        }

    }
}