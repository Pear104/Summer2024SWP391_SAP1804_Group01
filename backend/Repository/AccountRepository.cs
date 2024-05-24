using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.Interfaces;
using backend.Models;

namespace backend.Repository
{
    public class AccountRepository : IAccountRepository
    {
        private readonly ApplicationDbContext _context;

        public AccountRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public Task<Account> CreateAccountAsync(Account account)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAccountAsync(long id)
        {
            throw new NotImplementedException();
        }

        public Task<Account> GetAccountByIdAsync(long id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Account>> GetAllAccountsAsync()
        {
            throw new NotImplementedException();
        }

        public Task<Account> UpdateAccountAsync(Account account)
        {
            throw new NotImplementedException();
        }
    }
}