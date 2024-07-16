using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.DTOs.DiamondPrice;
using backend.Models;

namespace backend.Interfaces
{
    public interface IDiamondPriceRepository
    {
        Task<IEnumerable<DiamondPrice>> GetAllDiamondPricesAsync();
        Task<DiamondPrice?> GetDiamondPriceByIdAsync(long id);
        Task<DiamondPrice?> CreateDiamondPriceAsync(CreateDiamondPriceDTO diamondPriceDto);
    }
}
