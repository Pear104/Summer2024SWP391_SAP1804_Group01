using backend.Data;
using backend.DTOs.Authentication;
using backend.Enums;
using backend.Interfaces;
using backend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly ITokenService _tokenService;

        public AuthenticationController(ApplicationDbContext context, ITokenService tokenService)
        {
            _context = context;
            _tokenService = tokenService;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginDTO loginDto)
        {
            var account = await _context.Accounts.FirstOrDefaultAsync(x =>
                x.Email == loginDto.Email
            );

            if (account == null)
                return Unauthorized("User not found");
            else
            {
                var result = await _context.Accounts.FirstOrDefaultAsync(x =>
                    (x.Email == loginDto.Email && loginDto.Password == x.Password)
                );
                if (account.Password != loginDto.Password)
                {
                    return Unauthorized("Username not found and/or password incorrect");
                }
                else
                {
                    return Ok(
                        new AuthenticationResponse
                        {
                            Email = account.Email,
                            Token = await _tokenService.CreateToken(account)
                        }
                    );
                }
            }
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterDTO registerDto)
        {
            try
            {
                var existingAccount = await _context.Accounts.FirstOrDefaultAsync(x =>
                    x.Email == registerDto.Email
                );

                if (existingAccount == null)
                {
                    var account = new Account
                    {
                        Email = registerDto.Email,
                        Password = registerDto.Password,
                        Role = Role.Customer,
                    };
                    _context.Accounts.Add(account);
                    await _context.SaveChangesAsync();
                    return Ok(
                        new AuthenticationResponse
                        {
                            Email = account.Email,
                            Token = await _tokenService.CreateToken(account)
                        }
                    );
                }
                else
                {
                    return BadRequest("Your gmail already used");
                }
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
