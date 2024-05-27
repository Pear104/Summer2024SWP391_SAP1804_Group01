using System.Collections.Generic;
using System.Threading.Tasks;
using backend.DTOs.Authentication;
using backend.Models;

namespace backend.Interfaces
{
    public interface IAuthenticationService
    {
        Task<AuthenticationResponse?> Login(LoginDTO loginDto);
        Task<AuthenticationResponse?> Register(RegisterDTO registerDto);
    }
}
