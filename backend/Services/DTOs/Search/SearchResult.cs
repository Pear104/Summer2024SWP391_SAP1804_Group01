using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.DTOs.Accessory;

namespace backend.Services.DTOs.Search
{
    public class SearchResult
    {
        public List<DiamondDTO>? Diamonds { get; set; }
        public List<AccessoryDTO>? Accessories { get; set; }
        public int TotalPages { get; set; }
        public int PageSize { get; set; } = 5;
        public int CurrentPage { get; set; } = 1;
        public int TotalCount { get; set; }
    }
}