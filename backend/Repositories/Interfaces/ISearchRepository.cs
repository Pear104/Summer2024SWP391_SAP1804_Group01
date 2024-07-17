
using Helpers.DTOs.Search;
using Helpers.Queries;

namespace Repositories.Interfaces
{
    public interface ISearchRepository
    {
        Task<SearchResult> GetResult(SearchQuery query);
    }
}
