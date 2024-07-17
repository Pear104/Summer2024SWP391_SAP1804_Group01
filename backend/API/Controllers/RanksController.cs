using BusinessObjects.Models;
using Helpers.DTOs.Rank;
using Helpers.Mappers;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RanksController : ControllerBase
    {
        private readonly IRankService _rankService;

        public RanksController(IRankService rankService)
        {
            _rankService = rankService;
        }

        [HttpGet]
        public async Task<ActionResult> GetRanks()
        {
            var rankModels = await _rankService.GetAllRanks();
            return Ok(rankModels.Select(x => x.ToRankDTO()));
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Rank>> GetRank(long id)
        {
            var rankModel = await _rankService.GetRankById(id);
            if (rankModel == null)
            {
                return NotFound();
            }
            return Ok(rankModel.ToRankDTO());
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutRank(long id, UpdateRankDTO rankDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var rankModel = await _rankService.UpdateRank(id, rankDto.ToRankFromUpdate(id));

            if (rankModel == null)
            {
                return NotFound("Rank not found");
            }
            return Ok(rankModel.ToRankDTO());
        }

        [HttpPost]
        public async Task<ActionResult<Rank>> PostRank([FromBody] CreateRankDTO rankDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var rankModel = rankDto.ToRankFromCreate();

            await _rankService.CreateRank(rankModel);

            return CreatedAtAction(
                nameof(GetRank),
                new { id = rankModel.RankId },
                rankModel.ToRankDTO()
            );
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteRank([FromRoute] long id)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);
            var rankModel = await _rankService.DeleteRank(id);
            if (rankModel == null)
            {
                return NotFound("Rank does not exist");
            }
            return Ok(rankModel);
        }
    }
}
