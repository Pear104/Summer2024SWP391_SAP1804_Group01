using backend.DTOs.Authentication;

namespace backend.Interfaces
{
    public interface IAuthenticationService
    {
        Task<AuthenticationResponse?> Login(LoginDTO loginDto);
        Task<AuthenticationResponse?> Register(RegisterDTO registerDto);

        Task<AuthenticationResponse?> VerifyGmail(string token);
        Task<AuthenticationResponse?> GetResetToken(ResetPasswordDTO resetPasswordDto);
        Task<AuthenticationResponse?> LoginGoogle(LoginGoogleDTO loginGoogleDto);
        Task<AuthenticationResponse?> RegisterGoogle(RegisterDTO registerGoogleDto);
        Task<AuthenticationResponse?> ResetPassword(
            string email,
            UpdatePasswordDTO updatePasswordDto
        );
        //Task<RegisterDTO?> VerifyGmail(string token);
    }
}
