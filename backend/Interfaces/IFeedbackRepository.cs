using backend.DTOs.Feedback;
using backend.Helper;
using backend.Models;

namespace backend.Interfaces
{
    public interface IFeedbackRepository
    {
        Task<FeedbackResult> GetFeedbacksOfAccessoryAsync(FeedbackQuery query);
        Task<Feedback?> GetFeedbackByIdAsync(long id);
        Task<Feedback?> CreateFeedbackAsync(long userId, CreateFeedbackDTO FeedbackDTO);
    }
}
