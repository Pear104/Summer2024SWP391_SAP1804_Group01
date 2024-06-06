using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Shape;
using backend.Models;

namespace backend.Interfaces
{
    public interface IShapeRepository
    {
        Task<IEnumerable<Shape>> GetAllShapesAsync();
        Task<Shape?> GetShapeByIdAsync(long id);
        Task<Shape?> CreateShapeAsync(CreateShapeDTO shapeDto);
        Task<Shape?> UpdateShapeAsync(long id, UpdateShapeDTO shapeDto);
        Task<Shape?> DeleteShapeAsync(long id);
    }
}
