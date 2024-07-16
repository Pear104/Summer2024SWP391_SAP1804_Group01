using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using backend.DTOs.WarrantyRequest;
using backend.Services.Helper;
using backend.Interfaces;
using backend.Services.Mappers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class WarrantyRequestsController : ControllerBase
    {
        private readonly IWarrantyRequestRepository _warrantyRequestRepo;

        public WarrantyRequestsController(IWarrantyRequestRepository warrantyRequestRepo)
        {
            _warrantyRequestRepo = warrantyRequestRepo;
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
            var warrantyRequestResult = await _warrantyRequestRepo.GetAllWarrantyRequestsAsync(
                query
            );
            return Ok(warrantyRequestResult);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetWarrantyRequest(long id)
        {
            var WarrantyRequest = await _warrantyRequestRepo.GetWarrantyRequestByIdAsync(id);
            if (WarrantyRequest == null)
            {
                return NotFound();
            }

            return Ok(WarrantyRequest.ToWarrantyRequestDTO());
        }

        [HttpPost]
        [Authorize(Roles = ("Customer"))]
        public async Task<IActionResult> PostWarrantyRequest(
            [FromBody] CreateWarrantyRequestDTO warrantyRequestDto
        )
        {
            var accountId = User.FindFirst("accountId")?.Value;
            var newWarrantyRequest = await _warrantyRequestRepo.CreateWarrantyRequestAsync(
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
            var WarrantyRequest = await _warrantyRequestRepo.UpdateWarrantyRequestAsync(
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
            var deletedWarrantyRequest = await _warrantyRequestRepo.DeleteWarrantyRequestAsync(id);
            if (deletedWarrantyRequest == null)
            {
                return BadRequest("WarrantyRequest not found.");
            }
            return Ok(deletedWarrantyRequest);
        }
    }
}
