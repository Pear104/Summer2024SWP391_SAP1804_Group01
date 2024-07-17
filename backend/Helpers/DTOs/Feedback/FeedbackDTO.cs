using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Feedback
{
    public class FeedbackDTO
    {
        public int Score { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public string? Content { get; set; }
        public string? Username { get; set; }
    }
}
