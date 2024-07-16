using backend.BusinessOjects.Models;
using backend.Services.DTOs.Shape;

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
