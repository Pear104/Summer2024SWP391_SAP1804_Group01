namespace backend.DTOs.Authentication
{
    public class AuthenticationResponse
    {
        public long AccountId { get; set; }
        public string Token { get; set; } = string.Empty;
    }
}
