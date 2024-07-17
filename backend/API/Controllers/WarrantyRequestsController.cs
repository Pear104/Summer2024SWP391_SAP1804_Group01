using System.Security.Claims;
using Helpers.DTOs.WarrantyRequest;
using Helpers.Mappers;
using Helpers.Queries;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class WarrantyRequestsController : ControllerBase
    {
        private readonly IWarrantyRequestService _warrantyRequestService;

        public WarrantyRequestsController(IWarrantyRequestService warrantyRequestService)
        {
            _warrantyRequestService = warrantyRequestService;
        }

        [HttpGet]
        public async Task<ActionResult> GetWarrantyRequests([FromQuery] WarrantyRequestQuery query)
        {
            var accountId = User.FindFirst("accountId")?.Value;
            var role = User.FindFirst(ClaimTypes.Role)?.Value;
            if (role == "Customer")
            {
                query.CustomerId = long.Parse(accountId ?? "0");
            }

            if (role == "WarrantyStaff")
            {
                query.WarrantyStaffId = long.Parse(accountId ?? "0");
            }
            if (role == "DeliveryStaff")
            {
                query.DeliveryStaffId = long.Parse(accountId ?? "0");
            }
            var warrantyRequestResult = await _warrantyRequestService.GetAllWarrantyRequests(query);
            return Ok(warrantyRequestResult);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetWarrantyRequest(long id)
        {
            var WarrantyRequest = await _warrantyRequestService.GetWarrantyRequestById(id);
            if (WarrantyRequest == null)
            {
                return NotFound();
            }

            return Ok(WarrantyRequest.ToWarrantyRequestDTO());
        }

        [HttpPost]
        [Authorize(Roles = "Customer")]
        public async Task<IActionResult> PostWarrantyRequest(
            [FromBody] CreateWarrantyRequestDTO warrantyRequestDto
        )
        {
            var accountId = User.FindFirst("accountId")?.Value;
            var newWarrantyRequest = await _warrantyRequestService.CreateWarrantyRequest(
                long.Parse(accountId ?? "0"),
                warrantyRequestDto
            );
            if (newWarrantyRequest == null)
            {
                return BadRequest();
            }
            return Ok(newWarrantyRequest);
        }

        [HttpPut]
        [Route("{id}")]
        public async Task<IActionResult> PutWarrantyRequest(
            [FromRoute] long id,
            [FromBody] UpdateWarrantyRequestDTO WarrantyRequestDto
        )
        {
            var WarrantyRequest = await _warrantyRequestService.UpdateWarrantyRequest(
                id,
                WarrantyRequestDto
            );
            if (WarrantyRequest == null)
            {
                return NotFound("WarrantyRequest not found.");
            }
            return Ok(WarrantyRequest.ToWarrantyRequestDTO());
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteWarrantyRequest(long id)
        {
            var deletedWarrantyRequest = await _warrantyRequestService.DeleteWarrantyRequest(id);
            if (deletedWarrantyRequest == null)
            {
                return BadRequest("WarrantyRequest not found.");
            }
            return Ok(deletedWarrantyRequest);
        }
    }
}
