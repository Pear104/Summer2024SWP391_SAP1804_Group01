using Helpers.DTOs.Accessory;
using Helpers.DTOs.Account;
using Helpers.DTOs.Report;
using Helpers.DTOs.Transaction;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class ReportService : IReportService
    {
        private readonly IReportRepository _reportRepository;

        public ReportService(IReportRepository reportRepository)
        {
            _reportRepository = reportRepository;
        }

        public Task<List<AccessoryDTO>> GetAccessoryReport()
        {
            return _reportRepository.GetAccessoryReport();
        }

        public Task<IEnumerable<GroupedTransactionDTO>> GetAllTransactions()
        {
            return _reportRepository.GetAllTransactionsAsync();
        }

        public Task<List<AccountDTO>> GetCustomerReport()
        {
            return _reportRepository.GetCustomerReport();
        }

        public Task<List<AccountDTO>> GetDeliveryReport()
        {
            return _reportRepository.GetDeliveryReport();
        }

        public Task<ReportDTO> GetReport()
        {
            return _reportRepository.GetReport();
        }

        public Task<List<AccountDTO>> GetSalesReport()
        {
            return _reportRepository.GetSalesReport();
        }
    }
}
