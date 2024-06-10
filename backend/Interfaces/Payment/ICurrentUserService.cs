namespace backend.Interfaces
{
    public interface ICurrentUserService
    {
        string? AccountId { get; }
        string? IpAddress { get; }
    }
}
