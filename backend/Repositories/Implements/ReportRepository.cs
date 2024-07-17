using BusinessObjects.Enums;
using DAOs;
using Helpers.DTOs.Accessory;
using Helpers.DTOs.Account;
using Helpers.DTOs.Order;
using Helpers.DTOs.OrderDetail;
using Helpers.DTOs.Report;
using Helpers.DTOs.Transaction;
using Helpers.Mappers;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class ReportRepository : IReportRepository
    {
        private readonly ApplicationDbContext _context;

        public ReportRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<List<AccessoryDTO>> GetAccessoryReport()
        {
            var accessoryInOrderList = new List<(long id, int inOrderNumber)>();
            var orders = _context.Orders.AsQueryable();
            var orderDTOs = await orders
                .OrderByDescending(x => x.CreatedAt)
                .Select(x => new OrderDTO
                {
                    OrderId = x.OrderId,
                    OrderDetails = x
                        .OrderDetails.Select(y => new OrderDetailDTO
                        {
                            OrderDetailId = y.OrderDetailId,
                            Diamond = y.Diamond != null ? y.Diamond.ToDiamondDTO() : null,
                            DiamondPrice =
                                y.DiamondPrice != null ? y.DiamondPrice.ToDiamondPriceDTO() : null,
                            Accessory = y.Accessory != null ? y.Accessory.ToAccessoryDTO() : null,
                            MaterialPrice =
                                y.MaterialPrice != null
                                    ? y.MaterialPrice.ToMaterialPriceDTO()
                                    : null,
                            ItemPrice = y.ItemPrice,
                            Size = y.Size,
                        })
                        .ToList(),
                })
                .ToListAsync();

            //dat fix null
            foreach (var order in orderDTOs)
            {
                if (order.OrderDetails != null)
                {
                    foreach (var orderDetail in order.OrderDetails)
                    {
                        var accessory = orderDetail.Accessory;
                        if (accessory != null)
                        {
                            int index = accessoryInOrderList.FindIndex(x =>
                                x.id == accessory.AccessoryId
                            );
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
                else
                {
                    continue;
                }
            }
            accessoryInOrderList.Sort((x, y) => y.inOrderNumber.CompareTo(x.inOrderNumber));
            var returnAccessories = new List<AccessoryDTO>();
            foreach (var item in accessoryInOrderList)
            {
                var accessory = _context
                    .Accessories.Include(x => x.Shape)
                    .Include(x => x.AccessoryType)
                    .Include(x => x.AccessoryImages)
                    .FirstOrDefault(x => x.AccessoryId == item.id);
                if (accessory != null)
                    returnAccessories.Add(accessory.ToAccessoryDTO());
            }
            return returnAccessories.Take(5).ToList();
        }

        public async Task<IEnumerable<GroupedTransactionDTO>> GetAllTransactionsAsync()
        {
            var twelveMonthsAgo = DateTime.Now.AddMonths(-12);
            var transactions = await _context
                .Transactions.Where(t =>
                    t.CreatedAt >= twelveMonthsAgo
                    && t.TransactionStatus == TransactionStatus.Completed
                )
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

        public async Task<ReportDTO> GetReport()
        {
            double TotalSale = 0;
            var CompletedOrder = await _context
                .Orders.Where(o => o.OrderStatus == OrderStatus.Completed)
                .ToListAsync();
            foreach (var order in CompletedOrder)
            {
                TotalSale += order.TotalPrice;
            }

            int TotalCustomer = await _context.Accounts.CountAsync(c => c.Role == Role.Customer);
            int TotalOrder = await _context.Orders.CountAsync();
            var report = new ReportDTO
            {
                TotalCustomer = TotalCustomer,
                TotalSale = TotalSale,
                TotalOrder = TotalOrder
            };

            return report;
        }

        public async Task<List<AccountDTO>> GetSalesReport()
        {
            var role = Enum.Parse<Role>("SaleStaff");
            var accounts = _context.Accounts.Where(x => x.Role == role).AsQueryable();
            var accountDTOs = await accounts
                .OrderByDescending(x => x.OrdersOfSaleStaff.Count)
                .Select(x => new AccountDTO
                {
                    AccountId = x.AccountId,
                    Name = x.Name,
                    // Role = x.Role.ToString(),
                    // OrdersOfSaleStaff = x.OrdersOfSaleStaff.Select(y => new OrderDTO
                    // {
                    //     OrderId = y.OrderId,
                    //     OrderDetails = y.OrderDetails.Select(z => new OrderDetailDTO
                    //     {
                    //         OrderDetailId = z.OrderDetailId,
                    //         Diamond = z.Diamond != null ? z.Diamond.ToDiamondDTO() : null,
                    //         DiamondPrice = z.DiamondPrice != null ? z.DiamondPrice.ToDiamondPriceDTO() : null,
                    //         Accessory = z.Accessory != null ? z.Accessory.ToAccessoryDTO() : null,
                    //         MaterialPrice = z.MaterialPrice != null ? z.MaterialPrice.ToMaterialPriceDTO() : null,
                    //         ItemPrice = z.ItemPrice,
                    //         Size = z.Size,
                    //     }
                    //     ).ToList(),
                    // }).ToList(),
                    TotalOrders = x
                        .OrdersOfSaleStaff.Where(x =>
                            x.OrderStatus != OrderStatus.Pending
                            && x.OrderStatus != OrderStatus.Processing
                        )
                        .ToList()
                        .Count,
                })
                .ToListAsync();
            return accountDTOs.Take(5).ToList();
        }

        public async Task<List<AccountDTO>> GetDeliveryReport()
        {
            var role = Role.DeliveryStaff;
            var accounts = _context.Accounts.Where(x => x.Role == role).AsQueryable();
            var accountDTOs = await accounts
                .OrderByDescending(x => x.OrdersOfDeliveryStaff.Count)
                .Select(x => new AccountDTO
                {
                    AccountId = x.AccountId,
                    Name = x.Name,
                    // Role = x.Role.ToString(),
                    // OrdersOfSaleStaff = x.OrdersOfSaleStaff.Select(y => new OrderDTO
                    // {
                    //     OrderId = y.OrderId,
                    //     OrderDetails = y.OrderDetails.Select(z => new OrderDetailDTO
                    //     {
                    //         OrderDetailId = z.OrderDetailId,
                    //         Diamond = z.Diamond != null ? z.Diamond.ToDiamondDTO() : null,
                    //         DiamondPrice = z.DiamondPrice != null ? z.DiamondPrice.ToDiamondPriceDTO() : null,
                    //         Accessory = z.Accessory != null ? z.Accessory.ToAccessoryDTO() : null,
                    //         MaterialPrice = z.MaterialPrice != null ? z.MaterialPrice.ToMaterialPriceDTO() : null,
                    //         ItemPrice = z.ItemPrice,
                    //         Size = z.Size,
                    //     }
                    //     ).ToList(),
                    // }).ToList(),
                    TotalOrders = x
                        .OrdersOfDeliveryStaff.Where(x =>
                            x.OrderStatus != OrderStatus.Pending
                            && x.OrderStatus != OrderStatus.Processing
                        )
                        .ToList()
                        .Count,
                })
                .ToListAsync();
            return accountDTOs.Take(5).ToList();
        }

        public async Task<List<AccountDTO>> GetCustomerReport()
        {
            var role = Role.Customer;
            var accounts = _context.Accounts.Where(x => x.Role == role).AsQueryable();
            var accountDTOs = await accounts
                .OrderByDescending(x => x.OrdersOfCustomer.Count)
                .Select(x => new AccountDTO
                {
                    AccountId = x.AccountId,
                    Name = x.Name,
                    // Role = x.Role.ToString(),
                    // OrdersOfSaleStaff = x.OrdersOfSaleStaff.Select(y => new OrderDTO
                    // {
                    //     OrderId = y.OrderId,
                    //     OrderDetails = y.OrderDetails.Select(z => new OrderDetailDTO
                    //     {
                    //         OrderDetailId = z.OrderDetailId,
                    //         Diamond = z.Diamond != null ? z.Diamond.ToDiamondDTO() : null,
                    //         DiamondPrice = z.DiamondPrice != null ? z.DiamondPrice.ToDiamondPriceDTO() : null,
                    //         Accessory = z.Accessory != null ? z.Accessory.ToAccessoryDTO() : null,
                    //         MaterialPrice = z.MaterialPrice != null ? z.MaterialPrice.ToMaterialPriceDTO() : null,
                    //         ItemPrice = z.ItemPrice,
                    //         Size = z.Size,
                    //     }
                    //     ).ToList(),
                    // }).ToList(),
                    TotalOrders = x
                        .OrdersOfCustomer.Where(x =>
                            x.OrderStatus != OrderStatus.Pending
                            && x.OrderStatus != OrderStatus.Processing
                        )
                        .ToList()
                        .Count,
                })
                .ToListAsync();
            return accountDTOs.Take(5).ToList();
        }
    }
}
