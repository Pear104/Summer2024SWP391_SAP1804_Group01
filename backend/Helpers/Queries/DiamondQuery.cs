namespace Helpers.Queries
{
    public class DiamondQuery
    {
        public decimal? MinCarat { get; set; } = null;
        public decimal? MaxCarat { get; set; } = null;
        public string? MinClarity { get; set; } = null;
        public string? MaxClarity { get; set; } = null;
        public string? MinColor { get; set; } = null;
        public string? MaxColor { get; set; } = null;
        public string? Shape { get; set; }
        public string? Color { get; set; }
        public string? Clarity { get; set; }
        public string? SortBy { get; set; }
        public bool IsDescending { get; set; }
        public bool? IsAvailability { get; set; } = true;

        public bool? IsHidden { get; set; }
        public string? SearchQuery { get; set; } = null;
        public int PageNumber { get; set; } = 1;
        public int PageSize { get; set; } = 10;
    }
}
