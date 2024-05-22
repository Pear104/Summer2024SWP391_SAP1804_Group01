using backend.Data;
using backend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiamondController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public DiamondController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/<DiamondController>
        [HttpGet]
        public async Task<List<Diamond>> Get()
        {
            return await _context.Diamonds.ToListAsync();
        }

        // GET api/<DiamondController>/5
        [HttpGet("{id}")]
        public async Task<Diamond> Get(long id)
        {
            return await _context.Diamonds.FindAsync(id);
        }

        // POST api/<DiamondController>
        [HttpPost]
        public void Post([FromBody] string value) { }

        // PUT api/<DiamondController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value) { }

        // DELETE api/<DiamondController>/5
        [HttpDelete("{id}")]
        public void Delete(int id) { }
    }
}
