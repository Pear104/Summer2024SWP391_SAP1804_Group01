namespace Repositories.Interfaces.Payments
{
    public interface ICurrentUserService
    {
        string? AccountId { get; }
        string? IpAddress { get; }
    }
}
