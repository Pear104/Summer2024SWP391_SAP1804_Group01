using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Interfaces;
using backend.Mappers;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PriceRateController:ControllerBase
    {
        private readonly IPriceRateRepository _priceRateRepo;

        public PriceRateController(IPriceRateRepository priceRateRepo)
        {
            _priceRateRepo = priceRateRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetPriceRates()
        {
            var priceRates = await _priceRateRepo.GetAllPriceRateAsync();
            return Ok(priceRates.Select(x => x.ToPriceRateDTO()));
        }
        [HttpGet("latest")]
        public async Task<ActionResult> GetLatestPriceRate()
        {
            var priceRate = await _priceRateRepo.GetLatestPriceRateAsync();
            if (priceRate == null) {
                return NotFound();
            }
            return Ok(priceRate.ToPriceRateDTO());
        }
    }
}