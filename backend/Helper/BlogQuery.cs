using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Helper
{
    public class BlogQuery
    {
        public string? SortBy { get; set; }
        public bool IsDescending { get; set; }
        public Boolean? IsHidden { get; set; }
        public int? PageSize { get; set; }
        public int? PageNumber { get; set; }
    }
}
