using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Report
{
    public class ReportDTO
    {
        public double TotalSale { get; set; }
        public int TotalCustomer { get; set; }
        public int TotalOrder { get; set; }
    }
}
