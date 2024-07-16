using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Promotion;
using backend.Services.Helper;
using backend.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PromotionController : ControllerBase
    {
        private readonly IPromotionRepository _promotionRepo;

        public PromotionController(IPromotionRepository promotionRepo)
        {
            _promotionRepo = promotionRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetPromotions([FromQuery] PromotionQuery query)
        {
            var promotions = await _promotionRepo.GetAllPromotionAsync(query);
            return Ok(promotions);
        }

        [HttpGet("active")]
        public async Task<ActionResult> GetPromotionActive()
        {
            var promotions = await _promotionRepo.GetPromotionActive();
            return Ok(promotions);
        }

        [HttpGet("{code}")]
        public async Task<ActionResult> GetPromotion(string code)
        {
            var promotion = await _promotionRepo.GetPromotionByCodeAsync(code);
            if (promotion == null)
            {
                return NotFound();
            }

            return Ok(promotion);
        }

        [HttpPost]
        public async Task<ActionResult> CreatePromotion([FromBody] CreatePromotionDTO promotionCreateDto)
        {

            var newPromotion = await _promotionRepo.CreatePromotionAsync(promotionCreateDto);
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
            var promotion = await _promotionRepo.UpdatePromotionAsync(code, promotionDto);
            if (promotion == null)
            {
                return NotFound("Promotion not found.");
            }
            return Ok(promotion);
        }

    }
}
