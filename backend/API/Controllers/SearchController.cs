using Helpers.Queries;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SearchController : ControllerBase
    {
        private readonly ISearchService _searchService;

        public SearchController(ISearchService searchService)
        {
            _searchService = searchService;
        }

        [HttpGet]
        public async Task<ActionResult> GetResult([FromQuery] SearchQuery query)
        {
            var search = await _searchService.GetResult(query);
            return Ok(search);
        }
    }
}
