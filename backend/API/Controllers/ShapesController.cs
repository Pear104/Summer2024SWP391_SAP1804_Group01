using Helpers.DTOs.Shape;
using Helpers.Mappers;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ShapesController : ControllerBase
    {
        private readonly IShapeService _shapeService;

        public ShapesController(IShapeService shapeService)
        {
            _shapeService = shapeService;
        }

        [HttpGet]
        public async Task<ActionResult> GetShapes()
        {
            var shapeModels = await _shapeService.GetAllShapes();
            var shapeDTOs = shapeModels.Select(x => x.ToShapeDTO());
            return Ok(shapeDTOs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetShape(long id)
        {
            var shape = await _shapeService.GetShapeById(id);
            if (shape == null)
            {
                return NotFound();
            }

            return Ok(shape.ToShapeDTO());
        }

        [HttpPost]
        public async Task<IActionResult> PostShape([FromBody] CreateShapeDTO ShapeDto)
        {
            var newShape = await _shapeService.CreateShape(ShapeDto);
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
            var shape = await _shapeService.UpdateShape(id, ShapeDto);
            if (shape == null)
            {
                return NotFound("Shape not found.");
            }
            return Ok(shape.ToShapeDTO());
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteShape(long id)
        {
            var deletedShape = await _shapeService.DeleteShape(id);
            if (deletedShape == null)
            {
                return BadRequest("Shape not found.");
            }
            return Ok(deletedShape);
        }
    }
}
