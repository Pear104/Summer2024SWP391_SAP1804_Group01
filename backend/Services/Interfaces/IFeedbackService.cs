using BusinessObjects.Models;
using Helpers.DTOs.Feedback;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface IFeedbackService
    {
        Task<FeedbackResult> GetFeedbacksOfAccessory(FeedbackQuery query);
        Task<Feedback?> GetFeedbackById(long id);
        Task<Feedback?> CreateFeedback(long userId, CreateFeedbackDTO FeedbackDTO);
    }
}
