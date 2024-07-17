using Helpers.DTOs.AccessoryType;
using Helpers.Mappers;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AccessoryTypesController : ControllerBase
    {
        private readonly IAccessoryTypeService _accessoryTypeService;

        public AccessoryTypesController(IAccessoryTypeService accessoryTypeService)
        {
            _accessoryTypeService = accessoryTypeService;
        }

        [HttpGet]
        public async Task<ActionResult> GetAccessoryTypes()
        {
            var accessoryTypesModels = await _accessoryTypeService.GetAllAccessoryTypes();
            var accessoryTypesDTOs = accessoryTypesModels.Select(x => x.ToAccessoryTypeDTO());
            return Ok(accessoryTypesDTOs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetAccessoryTypes(long id)
        {
            var AccessoryTypes = await _accessoryTypeService.GetAccessoryTypeById(id);
            if (AccessoryTypes == null)
            {
                return NotFound();
            }

            return Ok(AccessoryTypes.ToAccessoryTypeDTO());
        }

        [HttpPost]
        public async Task<IActionResult> PostAccessoryTypes(
            [FromBody] CreateAccessoryTypeDTO accessoryTypesDto
        )
        {
            var newAccessoryType = await _accessoryTypeService.CreateAccessoryType(
                accessoryTypesDto
            );
            if (newAccessoryType == null)
            {
                return BadRequest("This accessory type already exists.");
            }
            return Ok(newAccessoryType);
        }

        [HttpPut]
        [Route("{id}")]
        public async Task<IActionResult> PutAccessoryTypes(
            [FromRoute] long id,
            [FromBody] UpdateAccessoryTypeDTO accessoryTypesDto
        )
        {
            var accessoryType = await _accessoryTypeService.UpdateAccessoryType(
                id,
                accessoryTypesDto
            );
            if (accessoryType == null)
            {
                return NotFound("Accessory type not found.");
            }
            return Ok(accessoryType.ToAccessoryTypeDTO());
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAccessoryTypes(long id)
        {
            var deletedAccessoryType = await _accessoryTypeService.DeleteAccessoryType(id);
            if (deletedAccessoryType == null)
            {
                return BadRequest("AccessoryTypes not found.");
            }
            return Ok(deletedAccessoryType);
        }
    }
}
