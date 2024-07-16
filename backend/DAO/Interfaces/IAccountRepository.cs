using backend.DTOs.Account;
using backend.Services.Helper;
using backend.Models;

namespace backend.Interfaces
{
    public interface IAccountRepository
    {
        Task<IEnumerable<Account>> GetAllAccountsAsync(AccountQuery query);
        Task<Account?> GetAccountByIdAsync(long id);
        Task<Account?> GetCustomerByIdAsync(long customerId);
        Task<Account?> GetAccountByEmailAsync(string email);
        Task<Account> CreateAccountAsync(Account account);
        Task<Account?> UpdateAccountAsync(long id, UpdateAccountDTO account);
        Task<Account?> UpdatePasswordAsync(long id, UpdatePasswordAccountDTO accountDto);
        Task<ListWithPagingDTO<Account>> SearchAccountOnRole(AccountSearchQuery query);

        Task<Account?> DeleteAccountAsync(long id, bool isDisable);
    }
}