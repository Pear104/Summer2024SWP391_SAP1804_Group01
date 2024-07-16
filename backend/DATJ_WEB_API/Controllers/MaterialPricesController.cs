using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.DiamondPrice;
using backend.Interfaces;
using backend.Services.Mappers;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MaterialPricesController : ControllerBase
    {
        private readonly IMaterialPriceRepository _materialPriceRepo;

        public MaterialPricesController(IMaterialPriceRepository materialPriceRepo)
        {
            _materialPriceRepo = materialPriceRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetDiamondPrices()
        {
            var materialPriceModels = await _materialPriceRepo.GetAllMaterialPricesAsync();
            var materialPriceDTOs = materialPriceModels.Select(x => x.ToMaterialPriceDTO());
            return Ok(materialPriceDTOs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetDiamondPrice(long id)
        {
            var materialPrice = await _materialPriceRepo.GetMaterialPriceByIdAsync(id);
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
            var newMaterialPrice = await _materialPriceRepo.CreateMaterialPriceAsync(
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
