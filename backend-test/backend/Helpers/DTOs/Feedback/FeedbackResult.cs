using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Feedback
{
    public class FeedbackResult
    {
        public IEnumerable<FeedbackDTO> Feedbacks { get; set; } = new List<FeedbackDTO>();
        public int TotalPages { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalCount { get; set; }
    }
}
