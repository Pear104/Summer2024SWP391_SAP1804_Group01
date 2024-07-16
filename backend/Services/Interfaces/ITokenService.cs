using backend.Services.DTOs.Authentication;
using backend.BusinessOjects.Models;

namespace backend.Services.Interfaces
{
    public interface ITokenService
    {
        string CreateToken(Account account);
        string CreateVerifyToken(RegisterDTO registerDto);
        string CreateResetToken(ResetPasswordDTO resetPasswordDto);
        RegisterDTO ParseToken(string verifyGmailToken);
    }
}
