using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs.Accessory
{
    public class AccessoryResult
    {
        public List<AccessoryDTO> Accessories { get; set; } = new List<AccessoryDTO>();
        public int TotalPages { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalCount { get; set; }
    }
}