using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.WarrantyCard;
using backend.Helper;
using backend.Interfaces;
using backend.Repository;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class WarrantyCardController : ControllerBase
    {
        private readonly IWarrantyCardRepository _warrantyCardRepository;
        public WarrantyCardController(IWarrantyCardRepository warrantyCardRepository)
        {
            _warrantyCardRepository = warrantyCardRepository;
        }
        [HttpGet]
        public async Task<ActionResult<WarrantyCardResult>> getWarrantyCards([FromQuery] WarrantyCardQuery query)
        {
            var warrantyCards = await _warrantyCardRepository.getWarrantyCards(query);
            return Ok(warrantyCards);
        }
    }
}