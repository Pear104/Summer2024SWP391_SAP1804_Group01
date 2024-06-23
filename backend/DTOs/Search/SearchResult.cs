using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Accessory;

namespace backend.DTOs.Search
{
    public class SearchResult
    {
        public List<DiamondDTO?> Diamonds { get; set; } = new List<DiamondDTO?>();
        public List<AccessoryDTO?> Accessories { get; set; } = new List<AccessoryDTO?>();
        public int TotalPages { get; set; }
        public int PageSize { get; set; } = 5;
        public int CurrentPage { get; set; } = 1;
        public int TotalCount { get; set; }
    }
}