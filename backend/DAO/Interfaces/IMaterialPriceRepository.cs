using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.DiamondPrice;
using backend.Models;

namespace backend.Interfaces
{
    public interface IMaterialPriceRepository
    {
        Task<IEnumerable<MaterialPrice>> GetAllMaterialPricesAsync();
        Task<MaterialPrice?> GetMaterialPriceByIdAsync(long id);
        Task<MaterialPrice?> CreateMaterialPriceAsync(CreateMaterialPriceDTO materialPriceDto);
    }
}
