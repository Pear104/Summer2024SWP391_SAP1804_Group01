using backend.DTOs.Accessory;
using backend.DTOs.Account;
using backend.DTOs.Transaction;

namespace backend.Interfaces
{
    public interface IReportRepository
    {
         Task<IEnumerable<GroupedTransactionDTO>> GetAllTransactionsAsync();
         Task<List<AccessoryDTO>> GetAccessoryReport();
         Task<List<AccountDTO>> GetSalesReport();
         // Task<List<DeliveryDTO>> GetDeliveryReport();
    }
}