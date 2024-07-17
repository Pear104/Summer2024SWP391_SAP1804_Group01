
using BusinessObjects.Models;
using Helpers.DTOs.Feedback;
using Helpers.Queries;

namespace Repositories.Interfaces
{
    public interface IFeedbackRepository
    {
        Task<FeedbackResult> GetFeedbacksOfAccessoryAsync(FeedbackQuery query);
        Task<Feedback?> GetFeedbackByIdAsync(long id);
        Task<Feedback?> CreateFeedbackAsync(long userId, CreateFeedbackDTO FeedbackDTO);
    }
}
