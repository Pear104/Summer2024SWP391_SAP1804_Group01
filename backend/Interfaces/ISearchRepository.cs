using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Search;
using backend.Helper;

namespace backend.Interfaces
{
    public interface ISearchRepository
    {
        Task<SearchResult> GetResult(SearchQuery query);
    }
}