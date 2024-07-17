using BusinessObjects.Enums;
using BusinessObjects.Models;
using DAOs;
using Helpers.DTOs.Account;
using Helpers.DTOs.Authentication;
using Helpers.HelperClasses;
using Helpers.Queries;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces;

namespace Repositories.Implements
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

        public async Task<Account> CreateAccountAsync(RegisterDTO registerDto)
        {
            var rank = await _context.Ranks.FirstOrDefaultAsync(x => x.RankName == "Bronze");
            var account = new Account()
            {
                Name = registerDto.Name,
                Email = registerDto.Email,
                Password = PasswordHasher.HashPassword(registerDto.Password),
                Role = Role.Customer,
                Gender = registerDto.Gender,
                // Dat fix null 25/06
                Rank = rank,
                PhoneNumber = registerDto.PhoneNumber,
                Address = registerDto.Address,
                Birthday = registerDto.Birthday,
            };
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
                .Include(x => x.WarrantyRequestsOfDeliveryStaff)
                .Include(x => x.WarrantyRequestsOfWarrantyStaff)
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

        public async Task<Account?> ResetPasswordAsync(long id, string password)
        {
            var existedAccount = await _context.Accounts.FindAsync(id);
            if (existedAccount == null)
            {
                return null;
            }
            existedAccount.Password = PasswordHasher.HashPassword(password);
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
                .Include(x => x.OrdersOfCustomer)
                .Include(x => x.WarrantyRequestsOfCustomer)
                .Include(x => x.WarrantyRequestsOfWarrantyStaff)
                .Include(x => x.WarrantyRequestsOfDeliveryStaff);
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
                TotalPages = (int)Math.Ceiling(totalCount / (double)accountQuery.PageSize)
            };
            return result;
        }

        public async Task<Account?> GetAccountByEmailAsync(string email)
        {
            return await _context.Accounts.FirstOrDefaultAsync(x => x.Email == email);
        }
    }
}
