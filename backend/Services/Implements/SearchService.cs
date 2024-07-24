using Helpers.DTOs.Search;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class SearchService : ISearchService
    {
        private readonly ISearchRepository _searchRepository;

        public SearchService(ISearchRepository searchRepository)
        {
            _searchRepository = searchRepository;
        }

        public Task<SearchResult> GetResult(SearchQuery query)
        {
           return _searchRepository.GetResult(query);
        }
    }
}
