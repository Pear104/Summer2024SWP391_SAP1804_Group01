using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Helper
{
    public class DiamondQuery
    {
        public Decimal? MinCarat { get; set; } = null;
        public Decimal? MaxCarat { get; set; } = null;
        public string? MinClarity { get; set; } = null;
        public string? MaxClarity { get; set; } = null;
        public string? MinColor { get; set; } = null;
        public string? MaxColor { get; set; } = null;
        public string? Shape { get; set; }
        public string? SortBy { get; set; }
        public bool IsDescending { get; set; }
        public int PageNumber { get; set; } = 1;
        public int PageSize { get; set; } = 20;
    }
}
