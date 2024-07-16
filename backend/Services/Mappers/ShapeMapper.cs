using backend.BusinessOjects.Models;
using backend.Services.DTOs.Shape;

namespace backend.Services.Mappers
{
    public static class ShapeMapper
    {
        public static ShapeDTO ToShapeDTO(this Shape shape)
        {
            return new ShapeDTO { ShapeId = shape.ShapeId, Name = shape.Name };
        }

        public static Shape ToShapeFromCreate(this CreateShapeDTO shapeDto)
        {
            return new Shape { Name = shapeDto.Name };
        }
    }
}
