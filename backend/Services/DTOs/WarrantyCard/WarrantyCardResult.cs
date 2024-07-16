using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs.WarrantyCard
{
    public class WarrantyCardResult
    {
        public List<WarrantyCardDTO>? WarrantyCards { get; set; }
        public int TotalPages { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalCount { get; set; }
    }
}