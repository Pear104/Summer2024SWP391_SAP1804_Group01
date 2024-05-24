using backend.Data;
using backend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiamondsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public DiamondsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Diamonds
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Diamond>>> GetDiamonds()
        {
            return await _context.Diamonds.Include(x => x.Shape).ToListAsync();
        }

        // GET: api/Diamonds/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Diamond>> GetDiamond(long id)
        {
            var diamond = await _context.Diamonds.Include(x => x.Shape).FirstOrDefaultAsync(x => x.DiamondId == id);

            if (diamond == null)
            {
                return NotFound();
            }

            return diamond;
        }

        // PUT: api/Diamonds/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDiamond(long id, Diamond diamond)
        {
            if (id != diamond.DiamondId)
            {
                return BadRequest();
            }

            _context.Entry(diamond).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DiamondExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Diamonds
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Diamond>> PostDiamond(Diamond diamond)
        {
            _context.Diamonds.Add(diamond);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetDiamond", new { id = diamond.DiamondId }, diamond);
        }

        // DELETE: api/Diamonds/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDiamond(long id)
        {
            var diamond = await _context.Diamonds.FindAsync(id);
            if (diamond == null)
            {
                return NotFound();
            }

            _context.Diamonds.Remove(diamond);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DiamondExists(long id)
        {
            return _context.Diamonds.Any(e => e.DiamondId == id);
        }
    }
}
