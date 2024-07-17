
using BusinessObjects.Models;
using Helpers.DTOs.Feedback;

namespace Helpers.Mappers
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
