using backend.Models;

namespace backend.Interfaces
{
    public interface IAccountRepository
    {
        Task<IEnumerable<Account>> GetAllAccountsAsync();
        Task<Account?> GetAccountByIdAsync(long id);
        Task<Account?> GetAccountByEmailAsync(string email);
        Task<Account> CreateAccountAsync(Account account);
        Task<Account?> UpdateAccountAsync(long id, Account account);
        // Task<Account?> DeleteAccountAsync(long id);
    }
}
