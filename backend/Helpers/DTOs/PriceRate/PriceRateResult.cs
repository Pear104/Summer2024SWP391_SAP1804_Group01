using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.PriceRate
{
    public class PriceRateResult
    {
        public List<PriceRateDTO> PriceRates { get; set; } = new List<PriceRateDTO>();
        public int TotalPages { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalCount { get; set; }
    }
}
