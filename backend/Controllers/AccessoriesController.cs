using backend.Data;
using backend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccessoriesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public AccessoriesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Accessories
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Accessory>>> GetAccessories()
        {
            return await _context.Accessories.ToListAsync();
        }

        // GET: api/Accessories/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Accessory>> GetAccessory(long id)
        {
            var accessory = await _context
                .Accessories.Include(a => a.AccessoryImages)
                .Include(a => a.Shape)
                .FirstOrDefaultAsync(a => a.AccessoryId == id);
            if (accessory == null)
            {
                return NotFound();
            }

            return accessory;
        }

        // PUT: api/Accessories/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAccessory(long id, Accessory accessory)
        {
            if (id != accessory.AccessoryId)
            {
                return BadRequest();
            }

            _context.Entry(accessory).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AccessoryExists(id))
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

        // POST: api/Accessories
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Accessory>> PostAccessory(Accessory accessory)
        {
            _context.Accessories.Add(accessory);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAccessory", new { id = accessory.AccessoryId }, accessory);
        }

        // DELETE: api/Accessories/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAccessory(long id)
        {
            var accessory = await _context.Accessories.FindAsync(id);
            if (accessory == null)
            {
                return NotFound();
            }

            _context.Accessories.Remove(accessory);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool AccessoryExists(long id)
        {
            return _context.Accessories.Any(e => e.AccessoryId == id);
        }
    }
}
