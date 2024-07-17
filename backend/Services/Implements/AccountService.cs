using BusinessObjects.Models;
using Helpers.DTOs.Account;
using Helpers.DTOs.Authentication;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class AccountService : IAccountService
    {
        private readonly IAccountRepository _accountRepository;

        public AccountService(IAccountRepository accountRepository)
        {
            _accountRepository = accountRepository;
        }

        public Task<Account> CreateAccount(RegisterDTO registerDTO)
        {
            return _accountRepository.CreateAccountAsync(registerDTO);
        }

        public Task<Account?> DeleteAccount(long id, bool isDisable)
        {
            return _accountRepository.DeleteAccountAsync(id, isDisable);
        }

        public Task<Account?> GetAccountByEmail(string email)
        {
            return _accountRepository.GetAccountByEmailAsync(email);
        }

        public Task<Account?> GetAccountById(long id)
        {
            return _accountRepository.GetAccountByIdAsync(id);
        }

        public Task<IEnumerable<Account>> GetAllAccounts(AccountQuery query)
        {
            return _accountRepository.GetAllAccountsAsync(query);
        }

        public Task<Account?> GetCustomerById(long customerId)
        {
            return _accountRepository.GetCustomerByIdAsync(customerId);
        }

        public Task<ListWithPagingDTO<Account>> SearchAccountOnRole(AccountSearchQuery query)
        {
            return _accountRepository.SearchAccountOnRole(query);
        }

        public Task<Account?> UpdateAccount(long id, UpdateAccountDTO account)
        {
            return _accountRepository.UpdateAccountAsync(id, account);
        }

        public Task<Account?> UpdatePassword(long id, UpdatePasswordAccountDTO accountDto)
        {
            return _accountRepository.UpdatePasswordAsync(id, accountDto);
        }
    }
}
