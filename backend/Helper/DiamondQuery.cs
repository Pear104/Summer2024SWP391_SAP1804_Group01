using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Helper
{
    public class DiamondQuery
    {
        public string? MinCarat { get; set; } = null;
        public string? MaxCarat { get; set; } = null;
        public string? Shape { get; set; } = null;
        public string? SortBy { get; set; } = "carat";
        public bool IsDecsending { get; set; } = false;
        public int PageNumber { get; set; } = 1;
        public int PageSize { get; set; } = 20;
    }
}
