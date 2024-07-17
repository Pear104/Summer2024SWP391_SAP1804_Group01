using BusinessObjects.Models;
using Helpers.DTOs.Shape;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class ShapeService : IShapeService
    {
        private readonly IShapeRepository _shapeRepository;

        public ShapeService(IShapeRepository shapeRepository)
        {
            _shapeRepository = shapeRepository;
        }

        public Task<Shape?> CreateShape(CreateShapeDTO shapeDto)
        {
            return _shapeRepository.CreateShapeAsync(shapeDto);
        }

        public Task<Shape?> DeleteShape(long id)
        {
            return _shapeRepository.DeleteShapeAsync(id);
        }

        public Task<IEnumerable<Shape>> GetAllShapes()
        {
            return _shapeRepository.GetAllShapesAsync();
        }

        public Task<Shape?> GetShapeById(long id)
        {
            return _shapeRepository.GetShapeByIdAsync(id);
        }

        public Task<Shape?> UpdateShape(long id, UpdateShapeDTO shapeDto)
        {
            return _shapeRepository.UpdateShapeAsync(id, shapeDto);
        }
    }
}
