using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccessoriesController : ControllerBase
    {
        private readonly IAccessoryRepository _accessoryRepo;

        public AccessoriesController(IAccessoryRepository accessoryRepo)
        {
            _accessoryRepo = accessoryRepo;
        }

        /// <summary>
        /// Get all accessory
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<ActionResult> GetAccessories([FromQuery] AccessoryQuery query)
        {
            var role = User.FindFirst(ClaimTypes.Role)?.Value;
            if (role == "Customer" || role == null)
            {
                query.IsHidden = false;
            }
            var accessoryDTOs = await _accessoryRepo.GetAllAccessoriesAsync(query);
            return Ok(accessoryDTOs);
        }

        /// <summary>
        /// Get accessory by Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Update accessory by Id
        /// </summary>
        /// <param name="id"></param>
        /// <param name="accessoryDto"></param>
        /// <returns></returns>
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAccessory(
            [FromRoute] long id,
            [FromBody] UpdateAccessoryDTO accessoryDto
        )
        {
            var accessory = await _accessoryRepo.UpdateAccessoryAsync(id, accessoryDto);
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

        [HttpDelete("{id}/{isHidden}")]
        [Authorize(Roles = "Administrator")]
        public async Task<IActionResult> DeleteAccessory(
            [FromRoute] long id,
            [FromRoute] bool isHidden
        )
        {
            var model = await _accessoryRepo.DeleteAccessoryAsync(id, isHidden);
            if (model == null)
            {
                return NotFound("Accessory not found.");
            }
            return Ok(model);
        }
    }
}
