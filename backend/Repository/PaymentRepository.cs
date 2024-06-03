using backend.Data;
using backend.Interfaces;
using backend.Models.Payment.Domain.Entities;
using backend.Payment_src.core.Payment.Application.Features.Commands;
using backend.Payment_src.core.Payment.Application.Features.Payment.Dtos;
using Microsoft.EntityFrameworkCore;

namespace backend.Repository
{
    public class PaymentRepository : IPaymentRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public PaymentRepository( ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<Payment> CreatePayment(Payment payment)
        {
            await _dbContext.AddAsync(payment);
            await _dbContext.SaveChangesAsync();
            return payment;
        }

        public async Task<List<Payment>> GetAllPayment()
        {
            var payments = await _dbContext.Payments.ToListAsync();
            return payments;
        }
        
        public async Task<Payment>? GetPaymentById(string id)
        {
            var payment = await _dbContext.Payments.FirstOrDefaultAsync(p => p.Id.ToLower().Equals(id.ToLower()) );
            return payment;
        }


    }
}
