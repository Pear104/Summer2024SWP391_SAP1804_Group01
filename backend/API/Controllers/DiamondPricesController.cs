using Helpers.DTOs.DiamondPrice;
using Helpers.Mappers;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DiamondPricesController : ControllerBase
    {
        private readonly IDiamondPriceService _diamondPriceService;

        public DiamondPricesController(IDiamondPriceService diamondPriceService)
        {
            _diamondPriceService = diamondPriceService;
        }

        [HttpGet]
        public async Task<ActionResult> GetDiamondPrices()
        {
            var diamondPriceModels = await _diamondPriceService.GetAllDiamondPrices();
            var diamondPriceDTOs = diamondPriceModels.Select(x => x.ToDiamondPriceDTO());
            return Ok(diamondPriceDTOs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetDiamondPrice(long id)
        {
            var diamondPrice = await _diamondPriceService.GetDiamondPriceById(id);
            if (diamondPrice == null)
            {
                return NotFound();
            }

            return Ok(diamondPrice.ToDiamondPriceDTO());
        }

        [HttpPost]
        public async Task<IActionResult> PostDiamondPrice(
            [FromBody] CreateDiamondPriceDTO diamondPriceDto
        )
        {
            var newDiamondPrice = await _diamondPriceService.CreateDiamondPrice(diamondPriceDto);
            if (newDiamondPrice == null)
            {
                return BadRequest("You dont have permission to create new diamond price.");
            }
            return Ok(newDiamondPrice);
        }
    }
}
