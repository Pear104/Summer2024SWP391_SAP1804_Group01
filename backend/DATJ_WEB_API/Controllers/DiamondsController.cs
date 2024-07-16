﻿using System.Security.Claims;
using backend.Data;
using backend.DTOs.Diamond;
using backend.Enums;
using backend.Services.Helper;
using backend.Interfaces;
using backend.Services.Mappers;
using backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiamondsController : ControllerBase
    {
        private readonly IDiamondRepository _diamondRepo;

        public DiamondsController(IDiamondRepository diamondRepo)
        {
            _diamondRepo = diamondRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetDiamonds([FromQuery] DiamondQuery query)
        {
            var role = User.FindFirst(ClaimTypes.Role)?.Value;
            if (role == "Customer" || role == null)
            {
                query.IsAvailability = true;
                query.IsHidden = false;
            }

            var diamondResult = await _diamondRepo.GetAllDiamondsAsync(query);
            // return Ok(diamondResult.Select(x => x.ToDiamondDTO()));
            return Ok(diamondResult);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetDiamond(long id)
        {
            var diamond = await _diamondRepo.GetDiamondByIdAsync(id);
            if (diamond == null)
            {
                return NotFound();
            }
            return Ok(diamond.ToDiamondDTO());
        }

        [HttpPost]
        public async Task<ActionResult> CreateDiamond([FromBody] CreateDiamondDTO diamond)
        {
            var diamondModel = await _diamondRepo.CreateDiamondAsync(diamond);
            if (diamondModel == null)
            {
                return BadRequest("The diamond's certificate number already exists.");
            }
            return Ok(diamondModel);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateDiamond(
            [FromRoute] long id,
            [FromBody] UpdateDiamondDTO diamondDto
        )
        {
            var diamondModel = await _diamondRepo.UpdateDiamondAsync(id, diamondDto);
            if (diamondModel == null)
            {
                return NotFound("Diamond not found.");
            }
            return Ok(diamondModel);
        }

        [HttpDelete("{id}/{isHidden}")]
        [Authorize(Roles = "Administrator")]
        public async Task<IActionResult> DeleteDiamond(
            [FromRoute] long id,
            [FromRoute] bool isHidden
        )
        {
            var model = await _diamondRepo.DeleteDiamondAsync(id, isHidden);
            if (model == null)
            {
                return NotFound("Diamond not found.");
            }
            return Ok(model);
        }
    }
}