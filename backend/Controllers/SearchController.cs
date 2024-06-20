using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Helper;
using backend.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SearchController : ControllerBase
    {
        private readonly ISearchRepository _searchRepo;
        public SearchController(ISearchRepository searchRepo)
        {
            _searchRepo = searchRepo;
        }
        [HttpGet]
        public async Task<ActionResult> GetResult([FromQuery] SearchQuery query)
        {
            var search = await _searchRepo.GetResult(query);
            return Ok(search);
        }
    }
}