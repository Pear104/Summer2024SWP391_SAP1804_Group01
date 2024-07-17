using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Accessory
{
    public class AccessoryResult
    {
        public IEnumerable<AccessoryDTO> Accessories { get; set; } = new List<AccessoryDTO>();
        public int TotalPages { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalCount { get; set; }
    }
}
