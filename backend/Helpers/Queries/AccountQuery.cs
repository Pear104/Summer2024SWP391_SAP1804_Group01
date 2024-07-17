namespace Helpers.Queries
{
    public class AccountQuery
    {
        public string? Role { get; set; } = null;
        public int PageSize { get; set; } = 1000;
        public int PageNumber { get; set; } = 1;
    }
}
