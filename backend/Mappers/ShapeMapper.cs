using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Shape;
using backend.Models;

namespace backend.Mappers
{
    public static class ShapeMapper
    {
        public static ShapeDTO ToShapeDTO(this Shape shape)
        {
            return new ShapeDTO
            {
                Name = shape.Name
            };
        }
    }
}