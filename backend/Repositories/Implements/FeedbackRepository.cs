using BusinessObjects.Models;
using DAOs;
using Helpers.DTOs.Feedback;
using Helpers.Mappers;
using Helpers.Queries;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class FeedbackRepository : IFeedbackRepository
    {
        private readonly ApplicationDbContext _context;

        public FeedbackRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Feedback?> CreateFeedbackAsync(long userId, CreateFeedbackDTO FeedbackDTO)
        {
            var existedFeedback = await _context.Feedbacks.FirstOrDefaultAsync(x =>
                x.AccessoryId == FeedbackDTO.AccessoryId
                && x.OrderDetailId == FeedbackDTO.OrderDetailId
            );
            if (existedFeedback != null)
            {
                return null;
            }
            var customer = await _context.Accounts.FindAsync(userId);
            if (customer == null)
            {
                return null;
            }
            var feedback = FeedbackDTO.ToFeedbackFromCreate();
            feedback.Customer = customer;
            var orderDetail = await _context.OrderDetails.FindAsync(FeedbackDTO.OrderDetailId);
            if (orderDetail == null)
            {
                return null;
            }
            var accessory = await _context.Accessories.FindAsync(FeedbackDTO.AccessoryId);
            if (accessory == null)
            {
                return null;
            }
            feedback.OrderDetail = orderDetail;
            feedback.Accessory = accessory;

            await _context.Feedbacks.AddAsync(feedback);
            await _context.SaveChangesAsync();
            return feedback;
        }

        public Task<Feedback?> GetFeedbackByIdAsync(long id)
        {
            throw new NotImplementedException();
        }

        public async Task<FeedbackResult> GetFeedbacksOfAccessoryAsync(FeedbackQuery query)
        {
            var feedbacksQuery = _context
                .Feedbacks.Include(x => x.OrderDetail.Order.Customer)
                .OrderBy(x => x.CreatedAt)
                .AsQueryable();

            feedbacksQuery = feedbacksQuery.Where(x => x.AccessoryId == query.AccessoryId);

            var totalCount = await feedbacksQuery.CountAsync();

            var totalPages = totalCount / (query.PageSize ?? 10);
            var feedbacks = await feedbacksQuery
                .Skip(((query.PageNumber ?? 1) - 1) * (query.PageSize ?? 10))
                .Take(query.PageSize ?? 10)
                .Select(x => x.ToFeedbackDTO())
                .ToListAsync();

            return new FeedbackResult
            {
                Feedbacks = feedbacks,
                TotalPages = totalPages,
                TotalCount = totalCount,
                PageSize = query.PageSize ?? 10,
                CurrentPage = query.PageNumber ?? 1
            };
        }
    }
}
