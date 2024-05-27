using backend.DTOs.Authentication;
using backend.Models;

namespace backend.Interfaces
{
    public interface ITokenService
    {
        string CreateToken(Account account);
        string CreateVerifyToken(RegisterDTO registerDto);
        RegisterDTO ParseToken(string verifyGmailToken);
    }
}
