using BusinessObjects.Models;
using Helpers.DTOs.Account;
using Helpers.DTOs.Authentication;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface IAccountService
    {
        Task<IEnumerable<Account>> GetAllAccounts(AccountQuery query);
        Task<Account?> GetAccountById(long id);
        Task<Account?> GetCustomerById(long customerId);
        Task<Account?> GetAccountByEmail(string email);
        Task<Account> CreateAccount(RegisterDTO registerDTO);
        Task<Account?> UpdateAccount(long id, UpdateAccountDTO account);
        Task<Account?> UpdatePassword(long id, UpdatePasswordAccountDTO accountDto);
        Task<ListWithPagingDTO<Account>> SearchAccountOnRole(AccountSearchQuery query);

        Task<Account?> DeleteAccount(long id, bool isDisable);
    }
}
