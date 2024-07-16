using backend.BusinessOjects.Models;
using backend.Services.DTOs.Feedback;
using backend.Services.QueriesHelper;

namespace backend.Interfaces
{
    public interface IFeedbackRepository
    {
        Task<FeedbackResult> GetFeedbacksOfAccessoryAsync(FeedbackQuery query);
        Task<Feedback?> GetFeedbackByIdAsync(long id);
        Task<Feedback?> CreateFeedbackAsync(long userId, CreateFeedbackDTO FeedbackDTO);
    }
}
