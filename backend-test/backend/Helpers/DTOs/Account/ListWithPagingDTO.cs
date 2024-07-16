namespace Helpers.DTOs.Account
{
    public class ListWithPagingDTO<T>
    {
        public List<T>? Content { get; set; }
        public int TotalPages { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalCount { get; set; }
    }
}
