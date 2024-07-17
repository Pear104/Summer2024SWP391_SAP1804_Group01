using System.Security.Claims;
using Helpers.DTOs.Diamond;
using Helpers.Mappers;
using Helpers.Queries;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiamondsController : ControllerBase
    {
        private readonly IDiamondService _diamondService;

        public DiamondsController(IDiamondService diamondService)
        {
            _diamondService = diamondService;
        }

        [HttpGet]
        public async Task<ActionResult> GetDiamonds([FromQuery] DiamondQuery query)
        {
            var role = User.FindFirst(ClaimTypes.Role)?.Value;
            if (role == "Customer" || role == null)
            {
                query.IsAvailability = true;
                query.IsHidden = false;
            }

            var diamondResult = await _diamondService.GetAllDiamonds(query);
            // return Ok(diamondResult.Select(x => x.ToDiamondDTO()));
            return Ok(diamondResult);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetDiamond(long id)
        {
            var diamond = await _diamondService.GetDiamondById(id);
            if (diamond == null)
            {
                return NotFound();
            }
            return Ok(diamond.ToDiamondDTO());
        }

        [HttpPost]
        public async Task<ActionResult> CreateDiamond([FromBody] CreateDiamondDTO diamond)
        {
            var diamondModel = await _diamondService.CreateDiamond(diamond);
            if (diamondModel == null)
            {
                return BadRequest("The diamond's certificate number already exists.");
            }
            return Ok(diamondModel);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateDiamond(
            [FromRoute] long id,
            [FromBody] UpdateDiamondDTO diamondDto
        )
        {
            var diamondModel = await _diamondService.UpdateDiamond(id, diamondDto);
            if (diamondModel == null)
            {
                return NotFound("Diamond not found.");
            }
            return Ok(diamondModel);
        }

        [HttpDelete("{id}/{isHidden}")]
        [Authorize(Roles = "Administrator")]
        public async Task<IActionResult> DeleteDiamond(
            [FromRoute] long id,
            [FromRoute] bool isHidden
        )
        {
            var model = await _diamondService.DeleteDiamond(id, isHidden);
            if (model == null)
            {
                return NotFound("Diamond not found.");
            }
            return Ok(model);
        }
    }
}
