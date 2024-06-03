using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.DiamondPrice;
using backend.Interfaces;
using backend.Mappers;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DiamondPricesController : ControllerBase
    {
        private readonly IDiamondPriceRepository _diamondPriceRepo;

        public DiamondPricesController(IDiamondPriceRepository diamondPriceRepo)
        {
            _diamondPriceRepo = diamondPriceRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetDiamondPrices()
        {
            var diamondPriceModels = await _diamondPriceRepo.GetAllDiamondPricesAsync();
            var diamondPriceDTOs = diamondPriceModels.Select(x => x.ToDiamontPriceDTO());
            return Ok(diamondPriceDTOs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetDiamondPrice(long id)
        {
            var diamondPrice = await _diamondPriceRepo.GetDiamondPriceByIdAsync(id);
            if (diamondPrice == null)
            {
                return NotFound();
            }

            return Ok(diamondPrice.ToDiamontPriceDTO());
        }

        [HttpPost]
        public async Task<IActionResult> PostDiamondPrice(
            [FromBody] CreateDiamondPriceDTO diamondPriceDto
        )
        {
            var newDiamondPrice = await _diamondPriceRepo.CreateDiamondPriceAsync(diamondPriceDto);
            if (newDiamondPrice == null)
            {
                return BadRequest("You dont have permission to create new diamond price.");
            }
            return Ok(newDiamondPrice);
        }
    }
}
