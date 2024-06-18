using backend.Data;
using backend.DTOs.Transaction;
using backend.Interfaces;
using backend.Models;
using Microsoft.EntityFrameworkCore;
using backend.Enums;
using backend.DTOs.Accessory;
using backend.Mappers;
using backend.DTOs;

namespace backend.Repository
{
    public class ReportRepository :  IReportRepository
    {
        private readonly ApplicationDbContext _context;

        public ReportRepository (ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<List<AccessoryDTO>> GetAccessoryReport()
        {            
            var accessoryInOrderList = new List<(long id, int inOrderNumber)>();
            var orders =  _context.Orders.AsQueryable();
            var orderDTOs = await orders
                .OrderByDescending(x => x.CreatedAt)
                .Select(x => new OrderDTO
                {
                    OrderId = x.OrderId,
                    OrderDetails = x.OrderDetails.Select(y => new OrderDetailDTO
                    {
                        OrderDetailId = y.OrderDetailId,
                        Diamond = y.Diamond != null ? y.Diamond.ToDiamondDTO() : null,
                        DiamondPrice = y.DiamondPrice != null ? y.DiamondPrice.ToDiamondPriceDTO() : null,
                        Accessory = y.Accessory != null ? y.Accessory.ToAccessoryDTO() : null,
                        MaterialPrice = y.MaterialPrice != null ? y.MaterialPrice.ToMaterialPriceDTO() : null,
                        ItemPrice = y.ItemPrice,
                        Size = y.Size,
                        
                    }).ToList(),
                    
                    
                    })
                .ToListAsync();

            foreach (var order in orderDTOs)
            {
                foreach (var orderDetail in order.OrderDetails)
                {
                    var accessory = orderDetail.Accessory;
                    if(accessory!=null)
                    {
                        int index = accessoryInOrderList.FindIndex(x => x.id == accessory.AccessoryId);
                        if (index != -1)
                        {
                            var item = accessoryInOrderList[index];
                            item.inOrderNumber += 1;
                            accessoryInOrderList[index] = item; // Update the list with the new value
                        }
                        else
                        {
                            accessoryInOrderList.Add((accessory.AccessoryId, 1));
                        }
                    }
                }
            }
            accessoryInOrderList.Sort((x, y) => y.inOrderNumber.CompareTo(x.inOrderNumber));
            List<AccessoryDTO> returnAccessories = new List<AccessoryDTO>();
            foreach(var item in accessoryInOrderList)
            {
                var accessory = _context.Accessories.Include(x=> x.AccessoryImages).FirstOrDefault(x=>x.AccessoryId == item.id);
                returnAccessories.Add(accessory.ToAccessoryDTO());
            }
            return returnAccessories.Take(5).ToList();
        }

        public async Task<IEnumerable<GroupedTransactionDTO>> GetAllTransactionsAsync()
        {
            var twelveMonthsAgo = DateTime.Now.AddMonths(-12);
            var transactions = await _context.Transactions
                .Where(t => t.CreatedAt >= twelveMonthsAgo && t.TransactionStatus == TransactionStatus.Completed)
                .ToListAsync();

            var groupedTransactions = transactions
                .GroupBy(t => new { t.CreatedAt.Year, t.CreatedAt.Month })
                .Select(g => new GroupedTransactionDTO
                {
                    Year = g.Key.Year,
                    Month = g.Key.Month,
                    Income = g.Sum(t => t.Amount)
                })
                .OrderBy(g => new DateTime(g.Year, g.Month, 1))
                .ToList();

            return groupedTransactions;
        }
    }
}