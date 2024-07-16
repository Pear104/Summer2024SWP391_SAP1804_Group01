using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Services.QueriesHelper
{
    public class FeedbackQuery
    {
        public long? AccessoryId { get; set; }
        public int? PageSize { get; set; }
        public int? PageNumber { get; set; }
    }
}
