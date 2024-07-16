// using System;
// using System.Collections.Generic;
// using System.Linq;
// using System.Threading.Tasks;
// using backend.Models;

using backend.Services.DTOs.WarrantyRequest;

namespace backend.Services.DTOs.Order
{
    public class WarrantyRequestResult
    {
        public List<WarrantyRequestDTO> WarrantyRequests { get; set; } = new List<WarrantyRequestDTO>();
        public int TotalPages { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalCount { get; set; }
    }
   
}
