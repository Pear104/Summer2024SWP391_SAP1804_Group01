using backend.Interfaces;
using System.Security.Claims;

namespace backend.Service
{
    public class CurrentUserService : ICurrentUserService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;

        public CurrentUserService(IHttpContextAccessor httpContextAccessor)
        {
            this._httpContextAccessor = httpContextAccessor;
        }
        //if error happen here, consider inject accountRepo
        public string? AccountId => _httpContextAccessor?.HttpContext?.User.FindFirstValue(ClaimTypes.NameIdentifier);

        public string? IpAddress => _httpContextAccessor?.HttpContext?.Connection?.LocalIpAddress?.ToString();
    }
}
