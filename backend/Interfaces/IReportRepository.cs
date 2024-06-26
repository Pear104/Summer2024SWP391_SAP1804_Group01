using backend.DTOs.Accessory;
using backend.DTOs.Account;
using backend.DTOs.Report;
using backend.DTOs.Transaction;
using backend.Helper;

namespace backend.Interfaces
{
    public interface IReportRepository
    {
        Task<IEnumerable<GroupedTransactionDTO>> GetAllTransactionsAsync(TransactionReportQuery query);
        Task<List<AccessoryDTO>> GetAccessoryReport();
        Task<ReportDTO> GetReport();
        Task<List<AccountDTO>> GetSalesReport();
        Task<List<AccountDTO>> GetDeliveryReport();
        Task<List<AccountDTO>> GetCustomerReport();

    }
}