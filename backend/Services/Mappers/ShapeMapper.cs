using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.DTOs.Shape;
using backend.BusinessOjects.Models;

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
