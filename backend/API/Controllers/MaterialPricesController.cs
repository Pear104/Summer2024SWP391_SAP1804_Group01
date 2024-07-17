using Helpers.DTOs.MaterialPrice;
using Helpers.Mappers;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MaterialPricesController : ControllerBase
    {
        private readonly IMaterialPriceService _materialPriceService;

        public MaterialPricesController(IMaterialPriceService materialPriceService)
        {
            _materialPriceService = materialPriceService;
        }

        [HttpGet]
        public async Task<ActionResult> GetDiamondPrices()
        {
            var materialPriceModels = await _materialPriceService.GetAllMaterialPrices();
            var materialPriceDTOs = materialPriceModels.Select(x => x.ToMaterialPriceDTO());
            return Ok(materialPriceDTOs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetDiamondPrice(long id)
        {
            var materialPrice = await _materialPriceService.GetMaterialPriceById(id);
            if (materialPrice == null)
            {
                return NotFound();
            }

            return Ok(materialPrice.ToMaterialPriceDTO());
        }

        [HttpPost]
        public async Task<IActionResult> PostDiamondPrice(
            [FromBody] CreateMaterialPriceDTO materialPriceDto
        )
        {
            var newMaterialPrice = await _materialPriceService.CreateMaterialPrice(
                materialPriceDto
            );
            if (newMaterialPrice == null)
            {
                return BadRequest("You dont have permission to update new material price.");
            }
            return Ok(newMaterialPrice);
        }
    }
}
