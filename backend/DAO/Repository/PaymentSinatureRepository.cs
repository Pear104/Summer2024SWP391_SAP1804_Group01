using backend.BusinessOjects.Models.Payment.Domain.Entities;
using backend.DAO.Data;
using backend.Interfaces;

namespace backend.Repository
{
    public class PaymentSinatureRepository : IPaymentSignatureRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public PaymentSinatureRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<PaymentSignature> CreateSigniture(PaymentSignature paymentSignature)
        {
            await _dbContext.PaymentSignatures.AddAsync(paymentSignature);
            await _dbContext.SaveChangesAsync();
            return paymentSignature;
        }
    }
}
