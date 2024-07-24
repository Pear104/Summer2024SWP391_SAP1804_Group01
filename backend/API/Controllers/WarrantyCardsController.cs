using Helpers.Queries;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class WarrantyCardsController : ControllerBase
    {
        private readonly IWarrantyCardService _warrantyCardService;

        public WarrantyCardsController(IWarrantyCardService warrantyCardService)
        {
            _warrantyCardService = warrantyCardService;
        }

        [HttpGet]
        public async Task<ActionResult> GetWarrantyCards([FromQuery] WarrantyCardQuery query)
        {
            var warrantyCards = await _warrantyCardService.getWarrantyCards(query);
            return Ok(warrantyCards);
        }

        [HttpGet("me")]
        [Authorize(Roles = "Customer, Manager, Administrator, SaleStaff, DeliveryStaff")]
        public async Task<ActionResult> GetUserWarrantyCards()
        {
            var accountId = long.Parse(User.FindFirst("accountId")?.Value ?? "0");
            if (accountId <= 0)
            {
                return BadRequest();
            }
            var warrantyCards = await _warrantyCardService.getUserWarrantyCards(accountId);
            return Ok(warrantyCards);
        }
    }
}
