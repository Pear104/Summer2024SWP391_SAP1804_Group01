using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.PriceRate;
using backend.Models;

namespace backend.Interfaces
{
    public interface IPriceRateRepository
    {
        Task<IEnumerable<PriceRate>> GetAllPriceRateAsync();
        Task<PriceRate?> GetLatestPriceRateAsync();
        Task<PriceRate?> CreatePriceRateAsync(long authorId, CreatePriceRateDTO blogDto);
        Task<PriceRate?> DeleteBlogAsync(long id);
    }
}