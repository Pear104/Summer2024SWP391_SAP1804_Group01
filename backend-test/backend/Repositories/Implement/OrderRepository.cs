
using BusinessObjects.Enums;
using BusinessObjects.Models;
using DAOs;
using Helpers.DTOs.Feedback;
using Helpers.DTOs.Order;
using Helpers.HelperClasses;
using Helpers.Queries;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces;
using Helpers.Mappers;
using Helpers.DTOs.OrderDetail;
using Helpers.DTOs.Accessory;

namespace Repositories.Implement
{
    public class OrderRepository : IOrderRepository
    {
        private readonly ApplicationDbContext _context;

        public OrderRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Order?> CompleteOrderAsync(string id)
        {
            var order = await _context.Orders.FirstOrDefaultAsync(o => o.OrderId == id);
            _context.Entry(order!).State = EntityState.Modified;
            order!.OrderStatus = OrderStatus.Processing;
            await _context.SaveChangesAsync();
            return order;
        }

        public async Task<Order?> CreateOrderAsync(long customerId, CreateOrderDTO orderDto)
        {
            var customer = await _context.Accounts.FindAsync(customerId);
            if (customer == null)
            {
                return null;
            }
            var rank = await _context.Ranks.FindAsync(customer.RankId);
            var priceRate = await _context
                .PriceRates.OrderByDescending(x => x.CreatedAt)
                .FirstOrDefaultAsync();
            Promotion? promotion = null;
            if (rank == null || priceRate == null)
            {
                return null;
            }
            var newOrder = new Order()
            {
                OrderId = DateTime.Now.Ticks.ToString(),
                Customer = customer,
                Rank = rank,
                PriceRate = priceRate,
                OrderStatus = OrderStatus.Pending,
                ShippingAddress = orderDto.ShippingAddress ?? customer.Address,
                PhoneNumber = orderDto.PhoneNumber ?? customer.PhoneNumber,
            };
            if (orderDto.PromotionCode != null)
            {
                promotion = await _context.Promotions.FirstOrDefaultAsync(x =>
                    x.PromotionCode == orderDto.PromotionCode
                );
                newOrder.Promotion = promotion;
                if (promotion == null)
                {
                    return null;
                }
                newOrder.TotalDiscountPercent = promotion.DiscountPercent + rank.Discount;
            }
            else
            {
                newOrder.TotalDiscountPercent = rank.Discount;
            }
            double totalPrice = 0;
            foreach (var orderDetailDto in orderDto.OrderDetails)
            {
                var diamond = _context.Diamonds.FirstOrDefault(x =>
                    x.DiamondId == orderDetailDto.DiamondId
                );
                if (diamond == null)
                {
                    return null;
                }
                if (diamond.Availability == false)
                {
                    return null;
                }

                var diamondPrice = _context
                    .DiamondPrices.Where(x =>
                        x.Clarity == diamond.Clarity
                        && x.Color == diamond.Color
                        && x.MinCaratEff <= diamond.Carat
                        && x.MaxCaratEff >= diamond.Carat
                    )
                    .OrderBy(x => x.EffTime)
                    .FirstOrDefault();

                if (diamond != null && diamondPrice != null)
                {
                    var orderDetail = orderDetailDto.ToOrderDetailFromCreate();
                    orderDetail.Order = newOrder;
                    orderDetail.Diamond = diamond;
                    orderDetail.DiamondPrice = diamondPrice;

                    var warrantyCardDiamond = new WarrantyCard
                    {
                        Diamond = diamond,
                        OrderDetail = orderDetail,
                        EndTime = DateTime.Now.AddMonths(24)
                    };
                    await _context.WarrantyCards.AddAsync(warrantyCardDiamond);

                    if (orderDetailDto.AccessoryId != null)
                    {
                        var accessory = _context
                            .Accessories.Include(x => x.AccessoryType)
                            .FirstOrDefault(x => x.AccessoryId == orderDetailDto.AccessoryId);
                        if (accessory == null)
                        {
                            return null;
                        }

                        var warrantyCardAccessory = new WarrantyCard
                        {
                            Accessory = accessory,
                            OrderDetail = orderDetail,
                            EndTime = DateTime.Now.AddMonths(12)
                        };
                        await _context.WarrantyCards.AddAsync(warrantyCardAccessory);

                        accessory.Quantity--;
                        _context.Entry(accessory).State = EntityState.Modified;
                        var materialPrice = _context
                            .MaterialPrices.OrderByDescending(x => x.EffTime)
                            .Where(x => x.Karat == accessory.Karat)
                            .FirstOrDefault();
                        orderDetail.Accessory = accessory;
                        orderDetail.MaterialPrice = materialPrice;
                        if (materialPrice != null)
                        {
                            orderDetail.ItemPrice =
                                PriceHelper.GetDiamondPrice(
                                    diamond.Carat,
                                    diamondPrice.UnitPrice,
                                    priceRate.Percent
                                )
                                + PriceHelper.GetAccessoryPrice(
                                    accessory.MaterialWeight,
                                    orderDetailDto.Size - 3,
                                    materialPrice.UnitPrice,
                                    accessory.AccessoryType.ProcessingPrice,
                                    priceRate.Percent
                                );
                        }
                    }
                    else
                    {
                        orderDetail.ItemPrice = PriceHelper.GetDiamondPrice(
                            diamond.Carat,
                            diamondPrice.UnitPrice,
                            priceRate.Percent
                        );
                    }

                    totalPrice += orderDetail.ItemPrice ?? 0;
                    await _context.OrderDetails.AddAsync(orderDetail);
                    diamond.Availability = false;
                    _context.Entry(diamond).State = EntityState.Modified;
                }
            }
            Console.WriteLine("totalPrice: " + totalPrice);
            newOrder.TotalPrice = totalPrice;
            customer.RewardPoint = customer.RewardPoint + (int)(totalPrice / 1000);
            var nextRank = await _context
                .Ranks.OrderBy(x => x.RewardPoint)
                .FirstOrDefaultAsync(x => x.RewardPoint > customer.RewardPoint);
            var newRank = await _context.Ranks.FirstOrDefaultAsync(x =>
                x.RankId == (nextRank != null ? nextRank.RankId - 1 : 6)
            );
            if (newRank == null)
            {
                return null;
            }
            customer.Rank = newRank;
            _context.Entry(customer).State = EntityState.Modified;
            await _context.Orders.AddAsync(newOrder);
            await _context.SaveChangesAsync();
            return newOrder;
        }

        public Task<Order?> CreateOrderPaypalAsync(long customerId, CreateOrderDTO orderDto)
        {
            throw new NotImplementedException();
        }

        public async Task<OrderResult?> GetAllOrdersAsync(OrderQuery query)
        {
            var orderQueries = _context.Orders.AsQueryable();
            if (query.CustomerId.HasValue)
            {
                orderQueries = orderQueries.Where(x => x.CustomerId == query.CustomerId);
            }

            if (query.OrderStatus.HasValue)
            {
                orderQueries = orderQueries.Where(x => x.OrderStatus == query.OrderStatus);
            }

            if (!string.IsNullOrEmpty(query.ShippingAddress))
            {
                orderQueries = orderQueries.Where(x =>
                    x.ShippingAddress.ToLower() == query.ShippingAddress.ToLower()
                );
            }

            if (!string.IsNullOrEmpty(query.SearchCustomerName))
            {
                orderQueries = orderQueries.Where(x =>
                    x.Customer!.Name.Contains(query.SearchCustomerName)
                );
            }

            if (query.SaleStaffId.HasValue)
            {
                orderQueries = orderQueries.Where(x => x.SaleStaffId == query.SaleStaffId);
            }

            if (query.DeliveryStaffId.HasValue)
            {
                orderQueries = orderQueries.Where(x => x.DeliveryStaffId == query.DeliveryStaffId);
            }

            if (query.MinTotalPrice.HasValue || query.MaxTotalPrice.HasValue)
            {
                var minPrice = query.MinTotalPrice ?? 0;
                var maxPrice = query.MaxTotalPrice ?? int.MaxValue;

                orderQueries = orderQueries.Where(x =>
                    x.TotalPrice >= minPrice && x.TotalPrice <= maxPrice
                );
            }

            if (!string.IsNullOrEmpty(query.PhoneNumber))
            {
                orderQueries = orderQueries.Where(x => x.PhoneNumber == query.PhoneNumber);
            }

            if (query.MinDate.HasValue)
            {
                orderQueries = orderQueries.Where(x => x.CreatedAt >= query.MinDate);
            }

            if (query.MaxDate.HasValue)
            {
                orderQueries = orderQueries.Where(x => x.CreatedAt <= query.MaxDate);
            }

            var totalCount = await orderQueries.CountAsync();

            var totalPages = (int)Math.Ceiling((double)totalCount / query.PageSize);

            var orderDTOs = await orderQueries
                .OrderByDescending(x => x.CreatedAt)
                .Skip((query.PageNumber - 1) * query.PageSize)
                .Take(query.PageSize)
                .Select(x => new OrderDTO
                {
                    OrderId = x.OrderId,
                    OrderDetails = x
                        .OrderDetails.Select(y => new OrderDetailDTO
                        {
                            OrderDetailId = y.OrderDetailId,
                            Diamond = y.Diamond != null ? y.Diamond.ToDiamondDTO() : null,
                            WarrantyCards = y
                                .WarrantyCards.Select(w => w.ToWarrantyCardDTO())
                                .ToList(),
                            DiamondPrice =
                                y.DiamondPrice != null ? y.DiamondPrice.ToDiamondPriceDTO() : null,
                            Accessory =
                                y.Accessory != null
                                    ? new AccessoryDTO
                                    {
                                        AccessoryId = y.Accessory.AccessoryId,
                                        Karat = y.Accessory.Karat,
                                        MaterialWeight = y.Accessory.MaterialWeight,
                                        Name = y.Accessory.Name,
                                        AccessoryType =
                                            y.Accessory.AccessoryType.ToAccessoryTypeDTO(),
                                        Shape = y.Accessory.Shape.ToShapeDTO(),
                                        AccessoryImages =
                                            y.Accessory.AccessoryImages != null
                                                ? y
                                                    .Accessory.AccessoryImages.Select(z =>
                                                        z.ToAccessoryImageDTO()
                                                    )
                                                    .ToList()
                                                : null,
                                    }
                                    : null,
                            MaterialPrice =
                                y.MaterialPrice != null
                                    ? y.MaterialPrice.ToMaterialPriceDTO()
                                    : null,
                            ItemPrice = y.ItemPrice,
                            Feedback =
                                y.Feedback != null
                                    ? new FeedbackDTO
                                    {
                                        Score = y.Feedback.Score,
                                        CreatedAt = y.Feedback.CreatedAt,
                                        Content = y.Feedback.Content,
                                        Username = x.Customer != null ? x.Customer.Name : null,
                                    }
                                    : null,
                            Size = y.Size,
                            // WarrantyCardId = y.WarrantyCard.WarrantyCardId,
                        })
                        .ToList(),
                    PriceRate = x.PriceRate != null ? x.PriceRate.ToPriceRateDTO() : null,
                    TotalPrice = x.TotalPrice,
                    TotalDiscountPercent = x.TotalDiscountPercent,
                    OrderStatus = x.OrderStatus.ToString(),
                    ShippingAddress = x.ShippingAddress,
                    CreatedAt = x.CreatedAt,
                    PhoneNumber = x.PhoneNumber,
                    CustomerId = x.CustomerId,
                    CustomerName = x.Customer != null ? x.Customer.Name : null,
                    SaleStaffId = x.SaleStaffId ?? 0,
                    SaleStaffName = x.SaleStaff != null ? x.SaleStaff.Name : null,
                    DeliveryStaffId = x.DeliveryStaffId ?? 0,
                    DeliveryStaffName = x.DeliveryStaff != null ? x.DeliveryStaff.Name : null,
                    Promotion = x.Promotion != null ? x.Promotion.ToPromotionDTO() : null,
                    // Transactions = x.Transactions.Select(y => y.ToTransactionDTO()).ToList(),
                    // Feedbacks = x.Feedbacks.Select(y => y.ToFeedbackDTO()).ToList(),
                })
                .ToListAsync();
            Console.WriteLine("Orders Retrieved: " + orderDTOs.Count());

            return new OrderResult
            {
                Orders = orderDTOs,
                TotalCount = totalCount,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber,
                TotalPages = totalPages
            };
        }

        public async Task<Order?> GetOrderByIdAsync(string id)
        {
            var order = await _context
                .Orders.Include(x => x.OrderDetails)
                .ThenInclude(x => x.Diamond)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Accessory)
                .ThenInclude(x => x != null ? x.AccessoryType : null)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Accessory)
                .ThenInclude(x => x != null ? x.AccessoryImages : null)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.Accessory)
                .ThenInclude(x => x != null ? x.Shape : null)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.MaterialPrice)
                .Include(x => x.OrderDetails)
                .ThenInclude(x => x.DiamondPrice)
                .Include(x => x.SaleStaff)
                .Include(x => x.PriceRate)
                .Include(x => x.DeliveryStaff)
                .Include(x => x.Customer)
                .Include(x => x.Promotion)
                .FirstOrDefaultAsync(x => x.OrderId.Equals(id));

            // var orderDTO = order?.ToOrderDTO();

            // if (orderDTO == null)
            // {
            //     return null;
            // }

            return order;
        }

        public async Task<Order?> UpdateOrderAsync(string id, UpdateOrderDTO order)
        {
            var existedOrder = _context
                .Orders.Include(o => o.OrderDetails)
                .ThenInclude(od => od.Diamond)
                .Include(o => o.OrderDetails)
                .ThenInclude(od => od.Accessory)
                .FirstOrDefault(x => x.OrderId.Equals(id));

            if (existedOrder == null)
            {
                return null;
            }
            if (order.OrderStatus != null)
            {
                existedOrder.OrderStatus = Enum.Parse<OrderStatus>(order.OrderStatus);
                if (order.OrderStatus == "Failed")
                {
                    foreach (var orderDetail in existedOrder.OrderDetails)
                    {
                        orderDetail.Diamond.Availability = true;
                        if (orderDetail.Accessory != null)
                        {
                            orderDetail.Accessory.Quantity++;
                        }
                    }
                }
                if (order.OrderStatus == "Completed")
                {
                    var completedCODTransaction = await _context.Transactions.FirstOrDefaultAsync(
                        x =>
                            x.OrderId == existedOrder.OrderId
                            && x.TransactionStatus == TransactionStatus.Completed
                            && x.PaymentMethod == "SHIP_COD"
                    );
                    if (completedCODTransaction != null)
                    {
                        var shipperMadeTransaction = new Transaction()
                        {
                            TransactionId =
                                $"ORD{existedOrder.OrderId}-TRS{DateTime.Now.Ticks.ToString()}",
                            Order = existedOrder,
                            PaymentMethod = "SHIP_COD",
                            Amount = existedOrder.TotalPrice - completedCODTransaction.Amount,
                            TransactionStatus = TransactionStatus.Completed
                        };
                        await _context.Transactions.AddAsync(shipperMadeTransaction);
                    }
                }
            }
            if (order.SaleStaffId != 0)
            {
                var saleStaff = _context.Accounts.FirstOrDefault(x =>
                    x.AccountId == order.SaleStaffId
                );
                existedOrder.SaleStaff = saleStaff;
            }
            if (order.DeliveryStaffId != 0)
            {
                var deliveryStaff = _context.Accounts.FirstOrDefault(x =>
                    x.AccountId == order.DeliveryStaffId
                );
                existedOrder.DeliveryStaff = deliveryStaff;
            }
            _context.Entry(existedOrder).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existedOrder;
        }
    }
}
