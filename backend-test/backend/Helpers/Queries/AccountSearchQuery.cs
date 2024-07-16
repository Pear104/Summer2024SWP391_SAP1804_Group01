namespace Helpers.Queries
{
    public class AccountSearchQuery
    {
        public string AccountName { get; set; } = string.Empty;
        public string AccountPhoneNumber { get; set; } = string.Empty;
        public string AccountRole { private get; set; } = string.Empty; //This is so that front-end can't directly set the role
        public int PageSize { get; set; } = 10;
        public int pageNumber { get; set; } = 1;

        public string GetRole()
        {
            return AccountRole;
        }
    }
}
