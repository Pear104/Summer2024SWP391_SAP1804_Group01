using Helpers.DTOs.PriceRate;
using Helpers.Mappers;
using Helpers.Queries;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PriceRateController : ControllerBase
    {
        private readonly IPriceRateService _priceRateService;

        public PriceRateController(IPriceRateService priceRateService)
        {
            _priceRateService = priceRateService;
        }

        [HttpGet]
        public async Task<ActionResult> GetPriceRates([FromQuery] PriceRateQuery query)
        {
            var priceRates = await _priceRateService.GetAllPriceRate(query);
            return Ok(priceRates);
        }

        [HttpGet("latest")]
        public async Task<ActionResult> GetLatestPriceRate()
        {
            var priceRate = await _priceRateService.GetLatestPriceRate();
            if (priceRate == null)
            {
                return NotFound();
            }
            return Ok(priceRate.ToPriceRateDTO());
        }

        [HttpPost]
        public async Task<ActionResult> CreatePriceRate(
            [FromBody] CreatePriceRateDTO priceRateCreateDto
        )
        {
            var authorId = User.FindFirst("accountId")?.Value;
            // Dat fix null 25/06
            if (authorId == null)
            {
                return BadRequest("You don't have permission to create price rate.");
            }
            var newPriceRate = await _priceRateService.CreatePriceRate(
                long.Parse(authorId),
                priceRateCreateDto
            );
            if (newPriceRate == null)
            {
                return BadRequest("You don't have permission to create price rate.");
            }
            return Ok(newPriceRate);
        }
    }
}
