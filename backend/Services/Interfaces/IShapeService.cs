using BusinessObjects.Models;
using Helpers.DTOs.Shape;

namespace Services.Interfaces
{
    public interface IShapeService
    {
        Task<IEnumerable<Shape>> GetAllShapes();
        Task<Shape?> GetShapeById(long id);
        Task<Shape?> CreateShape(CreateShapeDTO shapeDto);
        Task<Shape?> UpdateShape(long id, UpdateShapeDTO shapeDto);
        Task<Shape?> DeleteShape(long id);
    }
}
