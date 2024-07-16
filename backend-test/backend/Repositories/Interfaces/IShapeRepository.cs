
using BusinessObjects.Models;
using Helpers.DTOs.Shape;

namespace Repositories.Interfaces
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
