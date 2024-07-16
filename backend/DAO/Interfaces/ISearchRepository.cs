using backend.Services.DTOs.Search;
using backend.Services.QueriesHelper;

namespace backend.Interfaces
{
    public interface ISearchRepository
    {
        Task<SearchResult> GetResult(SearchQuery query);
    }
}
