using backend.Data;
using backend.Helper;
using backend.Interfaces;
using backend.Mappers;
using backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccessoriesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IAccessoryRepository _accessoryRepo;

        public AccessoriesController(
            ApplicationDbContext context,
            IAccessoryRepository accessoryRepo
        )
        {
            _context = context;
            _accessoryRepo = accessoryRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetAccessories([FromQuery] AccessoryQuery query)
        {
            var accessoryDTOs = await _accessoryRepo.GetAllAccessoriesAsync(query);
            return Ok(accessoryDTOs);
        }

        [HttpGet("{id}")]
        // [Authorize(Roles = ("Customer"))]
        public async Task<ActionResult> GetAccessory(long id)
        {
            var accessory = await _accessoryRepo.GetAccessoryByIdAsync(id);
            if (accessory == null)
            {
                return NotFound("The accessory does not exist");
            }

            return Ok(accessory);
        }

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

        [HttpPost]
        public async Task<ActionResult<Accessory>> PostAccessory(Accessory accessory)
        {
            _context.Accessories.Add(accessory);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAccessory", new { id = accessory.AccessoryId }, accessory);
        }

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
