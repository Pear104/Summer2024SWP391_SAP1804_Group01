using BusinessObjects.Models;
using Helpers.DTOs.Feedback;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class FeedbackService : IFeedbackService
    {
        private readonly IFeedbackRepository _feedbackRepository;

        public FeedbackService(IFeedbackRepository feedbackRepository)
        {
            _feedbackRepository = feedbackRepository;
        }

        public Task<Feedback?> CreateFeedback(long userId, CreateFeedbackDTO FeedbackDTO)
        {
            return _feedbackRepository.CreateFeedbackAsync(userId, FeedbackDTO);
        }

        public Task<Feedback?> GetFeedbackById(long id)
        {
            return _feedbackRepository.GetFeedbackByIdAsync(id);
        }

        public Task<FeedbackResult> GetFeedbacksOfAccessory(FeedbackQuery query)
        {
            return _feedbackRepository.GetFeedbacksOfAccessoryAsync(query);
        }
    }
}
