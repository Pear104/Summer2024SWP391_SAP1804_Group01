using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Repositories.Interfaces;
using Helpers.Mappers;
using Helpers.DTOs.AccessoryType;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AccessoryTypesController : ControllerBase
    {
        private readonly IAccessoryTypeRepository _accessoryTypeRepo;

        public AccessoryTypesController(IAccessoryTypeRepository accessoryTypeRepo)
        {
            _accessoryTypeRepo = accessoryTypeRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetAccessoryTypes()
        {
            var accessoryTypesModels = await _accessoryTypeRepo.GetAllAccessoryTypesAsync();
            var accessoryTypesDTOs = accessoryTypesModels.Select(x => x.ToAccessoryTypeDTO());
            return Ok(accessoryTypesDTOs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetAccessoryTypes(long id)
        {
            var AccessoryTypes = await _accessoryTypeRepo.GetAccessoryTypeByIdAsync(id);
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
            var newAccessoryType = await _accessoryTypeRepo.CreateAccessoryTypeAsync(
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
            var accessoryType = await _accessoryTypeRepo.UpdateAccessoryTypeAsync(
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
            var deletedAccessoryType = await _accessoryTypeRepo.DeleteAccessoryTypeAsync(id);
            if (deletedAccessoryType == null)
            {
                return BadRequest("AccessoryTypes not found.");
            }
            return Ok(deletedAccessoryType);
        }
    }
}
