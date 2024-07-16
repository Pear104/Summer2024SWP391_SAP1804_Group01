// using System;
// using System.Collections.Generic;
// using System.Linq;
// using System.Threading.Tasks;
// using backend.Models;

namespace Helpers.DTOs.Order
{
    public class OrderResult
    {
        public List<OrderDTO> Orders { get; set; } = new List<OrderDTO>();
        public int TotalPages { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalCount { get; set; }
    }
}
