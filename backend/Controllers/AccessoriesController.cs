using System.Security.Claims;
using System.Text;
using backend.Data;
using backend.DTOs.Accessory;
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
            // var role = User.FindFirst(ClaimTypes.Role)?.Value;
            // if (role == "Customer" || role == null)
            // {
            //     query.IsAvailability = true;
            // }
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
        public async Task<IActionResult> PutAccessory(
            [FromRoute] long id,
            [FromBody] UpdateAccessoryDTO accessoryDto
        )
        {
            var accessory = await _accessoryRepo.UpdateAccessoryAsync(id, accessoryDto);
            System.Console.WriteLine("ahihi");
            if (accessory == null)
            {
                return NotFound("Accessory not found.");
            }
            return Ok(accessory);
        }

        [HttpPost]
        public async Task<ActionResult> PostAccessory([FromBody] CreateAccessoryDTO accessoryDto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var newAccessory = await _accessoryRepo.CreateAccessoryAsync(accessoryDto);
            if (newAccessory == null)
            {
                return BadRequest("The accessory's shape/type does not exist");
            }
            return Ok(newAccessory);
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
