using backend.Data;
using backend.DTOs.Authentication;
using backend.Enums;
using backend.Helper;
using backend.Interfaces;
using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Service
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

            return new AuthenticationResponse
            {
                AccountId = account.AccountId,
                Token = _tokenService.CreateToken(account)
            };
        }

        public async Task<AuthenticationResponse?> Register(RegisterDTO registerDto)
        {
            var existingAccount = await _context.Accounts.FirstOrDefaultAsync(x =>
                x.Email == registerDto.Email
            );
            var rank = await _context.Ranks.FirstOrDefaultAsync(x => x.RankName == "Bronze");
            if (existingAccount == null)
            {
                var account = new Account
                {
                    Name = registerDto.Name,
                    Email = registerDto.Email,
                    Password = PasswordHasher.HashPassword(registerDto.Password),
                    Role = Role.Customer,
                    Gender = registerDto.Gender,
                    Rank = rank,
                    PhoneNumber = registerDto.PhoneNumber,
                    Address = registerDto.Address,
                    Birthday = registerDto.Birthday,
                };
                _context.Accounts.Add(account);
                await _context.SaveChangesAsync();
                return (
                    new AuthenticationResponse
                    {
                        AccountId = account.AccountId,
                        Token = _tokenService.CreateToken(account)
                    }
                );
            }
            else
            {
                return null;
            }
        }
    }
}
