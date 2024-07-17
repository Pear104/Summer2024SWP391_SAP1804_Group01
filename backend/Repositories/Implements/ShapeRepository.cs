using BusinessObjects.Models;
using DAOs;
using Helpers.DTOs.Shape;
using Helpers.Mappers;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class ShapeRepository : IShapeRepository
    {
        private readonly ApplicationDbContext _context;

        public ShapeRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Shape?> CreateShapeAsync(CreateShapeDTO shapeDto)
        {
            var newShape = await _context.Shapes.FirstOrDefaultAsync(x => x.Name == shapeDto.Name);
            if (newShape == null)
            {
                newShape = shapeDto.ToShapeFromCreate();
                await _context.Shapes.AddAsync(newShape);
                await _context.SaveChangesAsync();
                return newShape;
            }
            return null;
        }

        public async Task<Shape?> DeleteShapeAsync(long id)
        {
            var deletedModel = await _context.Shapes.FindAsync(id);
            if (deletedModel != null)
            {
                _context.Shapes.Remove(deletedModel);
                await _context.SaveChangesAsync();
                return deletedModel;
            }
            return null;
        }

        public async Task<IEnumerable<Shape>> GetAllShapesAsync()
        {
            var shapes = await _context.Shapes.ToListAsync();
            return shapes;
        }

        public async Task<Shape?> GetShapeByIdAsync(long id)
        {
            return await _context.Shapes.FindAsync(id);
        }

        public async Task<Shape?> UpdateShapeAsync(long id, UpdateShapeDTO shapeDto)
        {
            var existingShape = await _context.Shapes.FindAsync(id);
            if (existingShape == null)
            {
                return null;
            }

            existingShape.Name = shapeDto.Name;

            _context.Entry(existingShape).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existingShape;
        }
    }
}
