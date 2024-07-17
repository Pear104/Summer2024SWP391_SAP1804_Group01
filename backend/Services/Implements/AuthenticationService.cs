using Helpers.DTOs.Authentication;
using Helpers.HelperClasses;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class AuthenticationService : IAuthenticationService
    {
        private readonly ITokenService _tokenService;
        private readonly IAccountRepository _accountRepository;

        public AuthenticationService(
            ITokenService tokenService,
            IAccountRepository accountRepository
        )
        {
            _accountRepository = accountRepository;
            _tokenService = tokenService;
        }

        public async Task<AuthenticationResponse?> Login(LoginDTO loginDto)
        {
            var account = await _accountRepository.GetAccountByEmailAsync(loginDto.Email);

            if (account == null)
                return null;

            bool isPasswordValid = PasswordHasher.VerifyPassword(
                loginDto.Password,
                account.Password
            );

            if (!isPasswordValid)
                return null;

            return new AuthenticationResponse { Token = _tokenService.CreateToken(account) };
        }

        public async Task<AuthenticationResponse?> Register(RegisterDTO registerDto)
        {
            var existingAccount = await _accountRepository.GetAccountByEmailAsync(
                registerDto.Email
            );
            if (existingAccount != null)
            {
                return null;
            }
            return new AuthenticationResponse()
            {
                Token = _tokenService.CreateVerifyToken(registerDto)
            };
        }

        public async Task<AuthenticationResponse?> VerifyGmail(string token)
        {
            var registerDto = _tokenService.ParseToken(token);
            var existingAccount = await _accountRepository.GetAccountByEmailAsync(
                registerDto.Email
            );
            if (existingAccount != null)
            {
                return null;
            }
            var account = await _accountRepository.CreateAccountAsync(registerDto);
            return new AuthenticationResponse { Token = _tokenService.CreateToken(account) };
        }

        public async Task<AuthenticationResponse?> GetResetToken(ResetPasswordDTO resetPasswordDto)
        {
            var existingAccount = await _accountRepository.GetAccountByEmailAsync(
                resetPasswordDto.Email
            );
            if (existingAccount == null)
            {
                return null;
            }
            return new AuthenticationResponse()
            {
                Token = _tokenService.CreateResetToken(resetPasswordDto)
            };
        }

        public async Task<AuthenticationResponse?> ResetPassword(
            string email,
            UpdatePasswordDTO updatePasswordDto
        )
        {
            var existingAccount = await _accountRepository.GetAccountByEmailAsync(email);
            if (existingAccount == null)
            {
                return null;
            }
            var account = await _accountRepository.ResetPasswordAsync(
                existingAccount.AccountId,
                updatePasswordDto.Password
            );
            return new AuthenticationResponse()
            {
                Token = _tokenService.CreateToken(existingAccount)
            };
        }

        public async Task<AuthenticationResponse?> LoginGoogle(LoginGoogleDTO loginGoogleDto)
        {
            var existingAccount = await _accountRepository.GetAccountByEmailAsync(
                loginGoogleDto.Email
            );
            if (existingAccount == null)
            {
                return null;
            }
            return new AuthenticationResponse()
            {
                Token = _tokenService.CreateToken(existingAccount)
            };
        }

        public async Task<AuthenticationResponse?> RegisterGoogle(RegisterDTO registerGoogleDto)
        {
            var existingAccount = await _accountRepository.GetAccountByEmailAsync(
                registerGoogleDto.Email
            );
            if (existingAccount != null)
            {
                return null;
            }
            var account = await _accountRepository.CreateAccountAsync(registerGoogleDto);
            return new AuthenticationResponse { Token = _tokenService.CreateToken(account) };
        }
    }
}
