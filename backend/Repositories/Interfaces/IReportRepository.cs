
using Helpers.DTOs.Accessory;
using Helpers.DTOs.Account;
using Helpers.DTOs.Report;
using Helpers.DTOs.Transaction;

namespace Repositories.Interfaces
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
