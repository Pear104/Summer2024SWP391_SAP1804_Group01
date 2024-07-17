using Helpers.DTOs.Promotion;
using Helpers.Queries;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PromotionController : ControllerBase
    {
        private readonly IPromotionService _promotionService;

        public PromotionController(IPromotionService promotionService)
        {
            _promotionService = promotionService;
        }

        [HttpGet]
        public async Task<ActionResult> GetPromotions([FromQuery] PromotionQuery query)
        {
            var promotions = await _promotionService.GetAllPromotion(query);
            return Ok(promotions);
        }

        [HttpGet("active")]
        public async Task<ActionResult> GetPromotionActive()
        {
            var promotions = await _promotionService.GetPromotionActive();
            return Ok(promotions);
        }

        [HttpGet("{code}")]
        public async Task<ActionResult> GetPromotion(string code)
        {
            var promotion = await _promotionService.GetPromotionByCode(code);
            if (promotion == null)
            {
                return NotFound();
            }

            return Ok(promotion);
        }

        [HttpPost]
        public async Task<ActionResult> CreatePromotion(
            [FromBody] CreatePromotionDTO promotionCreateDto
        )
        {
            var newPromotion = await _promotionService.CreatePromotion(promotionCreateDto);
            if (newPromotion == null)
            {
                return BadRequest("Can't create new promotion.");
            }
            return Ok(newPromotion);
        }

        [HttpPut]
        [Route("{code}")]
        public async Task<IActionResult> PutPromotion(
            [FromRoute] string code,
            [FromBody] UpdatePromotionDTO promotionDto
        )
        {
            var promotion = await _promotionService.UpdatePromotion(code, promotionDto);
            if (promotion == null)
            {
                return NotFound("Promotion not found.");
            }
            return Ok(promotion);
        }
    }
}
