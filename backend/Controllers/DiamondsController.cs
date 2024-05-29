using backend.Data;
using backend.Interfaces;
using backend.Mappers;
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
        private readonly IDiamondRepository _diamondRepo;

        public DiamondsController(ApplicationDbContext context, IDiamondRepository diamondRepo)
        {
            _context = context;
            _diamondRepo = diamondRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetDiamonds()
        {
            var diamondModels = await _diamondRepo.GetAllDiamondsAsync();
            var diamondDTOs = diamondModels.Select(x => x.ToDiamondDTO());
            return Ok(diamondDTOs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Diamond>> GetDiamond(long id)
        {
            var diamond = await _diamondRepo.GetDiamondByIdAsync(id);
            if (diamond == null)
            {
                return NotFound();
            }
            return diamond;
        }

        [HttpPost]
        public async Task<ActionResult<Diamond>> PostDiamond(Diamond diamond)
        {
            _context.Diamonds.Add(diamond);
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetDiamond", new { id = diamond.DiamondId }, diamond);
        }

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
