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
        public async Task<ActionResult> GetUserWarrantyCards([FromQuery] WarrantyCardQuery query)
        {
            var accountId = User.FindFirst("accountId")?.Value;
            query.CustomerId = long.Parse(accountId ?? "0");
            var warrantyCards = await _warrantyCardService.getUserWarrantyCards(query);
            return Ok(warrantyCards);
        }
    }
}
