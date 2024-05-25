using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Models;

namespace backend.DTOs.Feedback
{
    public class FeedbackDTO
    {
        public int Score { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Content { get; set; } = String.Empty;
        public AccountDTO User { get; set; } = new AccountDTO();
    }
}