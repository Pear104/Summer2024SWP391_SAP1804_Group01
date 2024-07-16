namespace Helpers.Queries
{
    public class SearchQuery
    {
        public string keyword { get; set; } = string.Empty;
        public int PageSize { get; set; } = 6;
        public int PageNumber { get; set; } = 1;
    }
}
