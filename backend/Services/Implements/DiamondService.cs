using BusinessObjects.Models;
using Helpers.DTOs.Diamond;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class DiamondService : IDiamondService
    {
        private readonly IDiamondRepository _diamondRepository;

        public DiamondService(IDiamondRepository diamondRepository)
        {
            _diamondRepository = diamondRepository;
        }

        public Task<Diamond?> CreateDiamond(CreateDiamondDTO diamondDTO)
        {
            return _diamondRepository.CreateDiamondAsync(diamondDTO);
        }

        public Task<Diamond?> DeleteDiamond(long id, bool isHidden)
        {
            return _diamondRepository.DeleteDiamondAsync(id, isHidden);
        }

        public Task<DiamondResult> GetAllDiamonds(DiamondQuery query)
        {
            return _diamondRepository.GetAllDiamondsAsync(query);
        }

        public Task<Diamond?> GetDiamondById(long id)
        {
            return _diamondRepository.GetDiamondByIdAsync(id);
        }

        public Task<Diamond?> UpdateDiamond(long id, UpdateDiamondDTO diamondDTO)
        {
            return _diamondRepository.UpdateDiamondAsync(id, diamondDTO);
        }
    }
}
