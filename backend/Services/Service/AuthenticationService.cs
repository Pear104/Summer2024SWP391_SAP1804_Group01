using backend.DAO.Data;
using backend.Services.DTOs.Authentication;
using backend.Services.Enums;
using backend.Services.Helper;
using backend.Services.Interfaces;

namespace backend.Services.Service
{
    public class AuthenticationService : IAuthenticationService
    {
        private readonly ApplicationDbContext _context;
        private readonly ITokenService _tokenService;

        public AuthenticationService(ApplicationDbContext context, ITokenService tokenService)
        {
            _context = context;
            _tokenService = tokenService;
        }

        public async Task<AuthenticationResponse?> Login(LoginDTO loginDto)
        {
            var account = await _context.Accounts.FirstOrDefaultAsync(x =>
                x.Email == loginDto.Email
            );

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
            var existingAccount = await _context.Accounts.FirstOrDefaultAsync(x =>
                x.Email == registerDto.Email
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
            var existingAccount = await _context.Accounts.FirstOrDefaultAsync(x =>
                x.Email == registerDto.Email
            );
            if (existingAccount != null)
            {
                return null;
            }
            var rank = await _context.Ranks.FirstOrDefaultAsync(x => x.RankName == "Bronze");
            var account = new Account()
            {
                Name = registerDto.Name,
                Email = registerDto.Email,
                Password = PasswordHasher.HashPassword(registerDto.Password),
                Role = Role.Customer,
                Gender = registerDto.Gender,
                // Dat fix null 25/06
                Rank = rank ?? throw new Exception("Rank not found"),
                PhoneNumber = registerDto.PhoneNumber,
                Address = registerDto.Address,
                Birthday = registerDto.Birthday,
            };
            _context.Accounts.Add(account);
            await _context.SaveChangesAsync();

            return new AuthenticationResponse { Token = _tokenService.CreateToken(account) };
        }

        public async Task<AuthenticationResponse?> GetResetToken(ResetPasswordDTO resetPasswordDto)
        {
            var existingAccount = await _context.Accounts.FirstOrDefaultAsync(x =>
                x.Email == resetPasswordDto.Email
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
            var existingAccount = await _context.Accounts.FirstOrDefaultAsync(x =>
                x.Email == email
            );
            if (existingAccount == null)
            {
                return null;
            }
            existingAccount.Password = PasswordHasher.HashPassword(updatePasswordDto.Password);
            await _context.SaveChangesAsync();
            return new AuthenticationResponse()
            {
                Token = _tokenService.CreateToken(existingAccount)
            };
        }

        public async Task<AuthenticationResponse?> LoginGoogle(LoginGoogleDTO loginGoogleDto)
        {
            var existingAccount = await _context.Accounts.FirstOrDefaultAsync(x =>
                x.Email == loginGoogleDto.Email
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
            var existingAccount = await _context.Accounts.FirstOrDefaultAsync(x =>
                x.Email == registerGoogleDto.Email
            );
            if (existingAccount != null)
            {
                return null;
            }
            var rank = await _context.Ranks.FirstOrDefaultAsync(x => x.RankName == "Bronze");
            var account = new Account()
            {
                Name = registerGoogleDto.Name,
                Email = registerGoogleDto.Email,
                Password = PasswordHasher.HashPassword(registerGoogleDto.Password),
                Role = Role.Customer,
                Gender = registerGoogleDto.Gender,
                // Dat fix null 25/06
                Rank = rank ?? throw new Exception("Rank not found"),
                PhoneNumber = registerGoogleDto.PhoneNumber,
                Address = registerGoogleDto.Address,
                Birthday = registerGoogleDto.Birthday,
            };
            _context.Accounts.Add(account);
            await _context.SaveChangesAsync();

            return new AuthenticationResponse { Token = _tokenService.CreateToken(account) };
        }
    }
}
