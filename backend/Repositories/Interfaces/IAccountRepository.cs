using BusinessObjects.Models;
using Helpers.DTOs.Account;
using Helpers.DTOs.Authentication;
using Helpers.Queries;

namespace Repositories.Interfaces
{
    public interface IAccountRepository
    {
        Task<IEnumerable<Account>> GetAllAccountsAsync(AccountQuery query);
        Task<Account?> GetAccountByIdAsync(long id);
        Task<Account?> GetCustomerByIdAsync(long customerId);
        Task<Account?> GetAccountByEmailAsync(string email);
        Task<Account> CreateAccountAsync(RegisterDTO registerDto);
        Task<Account?> UpdateAccountAsync(long id, UpdateAccountDTO account);
        Task<Account?> UpdatePasswordAsync(long id, UpdatePasswordAccountDTO accountDto);
        Task<Account?> ResetPasswordAsync(long id, string password);
        Task<ListWithPagingDTO<Account>> SearchAccountOnRole(AccountSearchQuery query);

        Task<Account?> DeleteAccountAsync(long id, bool isDisable);
    }
}
