using backend.BusinessOjects.Models;
using backend.Services.DTOs.Feedback;

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
