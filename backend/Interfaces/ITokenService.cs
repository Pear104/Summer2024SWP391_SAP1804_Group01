using backend.Models;

namespace backend.Interfaces
{
    public interface ITokenService
    {
        string CreateToken(Account account);
    }
}
