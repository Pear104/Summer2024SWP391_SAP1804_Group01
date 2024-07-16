using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Shape;
using backend.Interfaces;
using backend.Services.Mappers;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ShapesController : ControllerBase
    {
        private readonly IShapeRepository _shapeRepo;

        public ShapesController(IShapeRepository shapeRepo)
        {
            _shapeRepo = shapeRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetShapes()
        {
            var shapeModels = await _shapeRepo.GetAllShapesAsync();
            var shapeDTOs = shapeModels.Select(x => x.ToShapeDTO());
            return Ok(shapeDTOs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetShape(long id)
        {
            var shape = await _shapeRepo.GetShapeByIdAsync(id);
            if (shape == null)
            {
                return NotFound();
            }

            return Ok(shape.ToShapeDTO());
        }

        [HttpPost]
        public async Task<IActionResult> PostShape([FromBody] CreateShapeDTO ShapeDto)
        {
            var newShape = await _shapeRepo.CreateShapeAsync(ShapeDto);
            if (newShape == null)
            {
                return BadRequest("This shape already exists.");
            }
            return Ok(newShape);
        }

        [HttpPut]
        [Route("{id}")]
        public async Task<IActionResult> PutShape(
            [FromRoute] long id,
            [FromBody] UpdateShapeDTO ShapeDto
        )
        {
            var shape = await _shapeRepo.UpdateShapeAsync(id, ShapeDto);
            if (shape == null)
            {
                return NotFound("Shape not found.");
            }
            return Ok(shape.ToShapeDTO());
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteShape(long id)
        {
            var deletedShape = await _shapeRepo.DeleteShapeAsync(id);
            if (deletedShape == null)
            {
                return BadRequest("Shape not found.");
            }
            return Ok(deletedShape);
        }
    }
}
