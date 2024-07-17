using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Transaction
{
    public class GroupedTransactionDTO
    {
        public int Year { get; set; }
        public int Month { get; set; }

        // public double Expense { get; set; }
        public double Income { get; set; }
    }
}
