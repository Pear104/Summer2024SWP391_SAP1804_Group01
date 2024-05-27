using backend.DTOs.Rank;
using backend.Interfaces;
using backend.Mappers;
using backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RanksController : ControllerBase
    {
        private readonly IRankRepository _rankRepo;

        public RanksController(IRankRepository rankRepo)
        {
            _rankRepo = rankRepo;
        }

        [HttpGet]
        [Authorize(Roles = "Customer")]
        public async Task<ActionResult> GetRanks()
        {
            var rankModels = await _rankRepo.GetAllRanksAsync();
            return Ok(rankModels.Select(x => x.ToRankDTO()));
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Rank>> GetRank(long id)
        {
            var rankModel = await _rankRepo.GetRankByIdAsync(id);
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

            var rankModel = await _rankRepo.UpdateRankAsync(id, rankDto.ToRankFromUpdate(id));

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

            await _rankRepo.CreateRankAsync(rankModel);

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
            var rankModel = await _rankRepo.DeleteRankAsync(id);
            if (rankModel == null)
            {
                return NotFound("Rank does not exist");
            }
            return Ok(rankModel);
        }
    }
}
