using backend.Services.DTOs.Accessory;
using backend.Services.DTOs.Account;
using backend.Services.DTOs.Report;
using backend.Services.DTOs.Transaction;

namespace backend.Interfaces
{
    public interface IReportRepository
    {
        Task<IEnumerable<GroupedTransactionDTO>> GetAllTransactionsAsync();
        Task<List<AccessoryDTO>> GetAccessoryReport();
        Task<ReportDTO> GetReport();
        Task<List<AccountDTO>> GetSalesReport();
        Task<List<AccountDTO>> GetDeliveryReport();
        Task<List<AccountDTO>> GetCustomerReport();
    }
}
