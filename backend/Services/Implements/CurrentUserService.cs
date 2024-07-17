using System.Security.Claims;
using Microsoft.AspNetCore.Http;
using Repositories.Interfaces.Payments;

namespace Services.Implements
{
    public class CurrentUserService : ICurrentUserService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;

        public CurrentUserService(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        //if error happen here, consider inject accountRepo
        public string? AccountId =>
            _httpContextAccessor?.HttpContext?.User.FindFirstValue(ClaimTypes.NameIdentifier);

        public string? IpAddress =>
            _httpContextAccessor?.HttpContext?.Connection?.LocalIpAddress?.ToString();
    }
}
