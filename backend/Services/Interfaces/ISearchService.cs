using Helpers.DTOs.Search;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface ISearchService
    {
        Task<SearchResult> GetResult(SearchQuery query);
    }
}
