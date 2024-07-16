using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Services.QueriesHelper
{
    public class AccessoryQuery
    {
        public int Karat { get; set; } = 0;
        public float MinMaterialWeight { get; set; } = 0;
        public float MaxMaterialWeight { get; set; } = 100;
        public string? Name { get; set; } = null;
        public string? Shape { get; set; } = null;
        public bool? IsHidden { get; set; }
        public int PageSize { get; set; } = 20;
        public int PageNumber { get; set; } = 1;
    }
}
