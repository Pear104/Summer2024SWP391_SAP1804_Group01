using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Services.DTOs.Feedback;
using backend.BusinessOjects.Models;

namespace backend.Services.Mappers
{
    public static class FeedbackMapper
    {
        public static FeedbackDTO ToFeedbackDTO(this Feedback Feedback)
        {
            return new FeedbackDTO
            {
                Content = Feedback.Content,
                Score = Feedback.Score,
                Username = Feedback?.OrderDetail?.Order?.Customer?.Name,
                CreatedAt = Feedback.CreatedAt
            };
        }

        public static Feedback ToFeedbackFromCreate(this CreateFeedbackDTO FeedbackDto)
        {
            return new Feedback { Content = FeedbackDto.Content, Score = FeedbackDto.Score, };
        }
    }
}
