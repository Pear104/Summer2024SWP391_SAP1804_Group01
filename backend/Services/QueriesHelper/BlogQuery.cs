using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Services.QueriesHelper
{
    public class BlogQuery
    {
        public string? Title { get; set; }
        public string? SortBy { get; set; }
        public bool IsDescending { get; set; }
        public bool? IsHidden { get; set; }
        public int? PageSize { get; set; }
        public int? PageNumber { get; set; }
    }
}
