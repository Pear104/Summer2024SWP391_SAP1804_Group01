using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.PriceRate;
using backend.Helper;
using backend.Interfaces;
using backend.Mappers;
using backend.Models;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PriceRateController : ControllerBase
    {
        private readonly IPriceRateRepository _priceRateRepo;

        public PriceRateController(IPriceRateRepository priceRateRepo)
        {
            _priceRateRepo = priceRateRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetPriceRates([FromQuery] PriceRateQuery query)
        {
            var priceRates = await _priceRateRepo.GetAllPriceRateAsync(query);
            return Ok(priceRates);
        }

        [HttpGet("latest")]
        public async Task<ActionResult> GetLatestPriceRate()
        {
            var priceRate = await _priceRateRepo.GetLatestPriceRateAsync();
            if (priceRate == null)
            {
                return NotFound();
            }
            return Ok(priceRate.ToPriceRateDTO());
        }

        [HttpPost]
        public async Task<ActionResult> CreatePriceRate([FromBody] CreatePriceRateDTO priceRateCreateDto)
        {
            var authorId = User.FindFirst("accountId")?.Value;
            // Dat fix null 25/06
            if (authorId == null)
            {
                return BadRequest("You don't have permission to create price rate.");
            }
            var newPriceRate = await _priceRateRepo.CreatePriceRateAsync(long.Parse(authorId), priceRateCreateDto);
            if (newPriceRate == null)
            {
                return BadRequest("You don't have permission to create price rate.");
            }
            return Ok(newPriceRate);
        }
    }
}