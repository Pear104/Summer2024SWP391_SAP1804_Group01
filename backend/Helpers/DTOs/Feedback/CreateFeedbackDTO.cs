using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helpers.DTOs.Feedback
{
    public class CreateFeedbackDTO
    {
        public long? OrderDetailId { get; set; }
        public long? AccessoryId { get; set; }
        public int Score { get; set; }
        public string? Content { get; set; }
    }
}
