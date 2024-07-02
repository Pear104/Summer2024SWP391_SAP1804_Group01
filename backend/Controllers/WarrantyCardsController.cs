using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.WarrantyCard;
using backend.Helper;
using backend.Interfaces;
using backend.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class WarrantyCardsController : ControllerBase
    {
        private readonly IWarrantyCardRepository _warrantyCardRepository;

        public WarrantyCardsController(IWarrantyCardRepository warrantyCardRepository)
        {
            _warrantyCardRepository = warrantyCardRepository;
        }

        [HttpGet]
        public async Task<ActionResult> GetWarrantyCards(
            [FromQuery] WarrantyCardQuery query
        )
        {
            var warrantyCards = await _warrantyCardRepository.getWarrantyCards(query);
            return Ok(warrantyCards);
        }

        [HttpGet("me")]
        [Authorize(Roles = "Customer, Manager, Administrator, SaleStaff, DeliveryStaff")]
        public async Task<ActionResult> GetUserWarrantyCards()
        {
            var accountId = User.FindFirst("accountId")?.Value;
            var warrantyCards = await _warrantyCardRepository.getUserWarrantyCards(
                long.Parse(accountId ?? "0")
            );
            return Ok(warrantyCards);
        }
    }
}
