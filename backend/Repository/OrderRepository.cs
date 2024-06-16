using backend.Data;
using backend.DTOs;
using backend.DTOs.Order;
using backend.Enums;
using backend.Helper;
using backend.Interfaces;
using backend.Mappers;
using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Repository
{
    public class OrderRepository : IOrderRepository
    {
        private readonly ApplicationDbContext _context;

        public OrderRepository(ApplicationDbContext context)
        {
            _context = context;
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
            if (orderDto.PromotionId != null)
            {
                promotion = await _context.Promotions.FirstOrDefaultAsync(x =>
                    x.PromotionId == orderDto.PromotionId
                );
                newOrder.Promotion = promotion;
                if (promotion == null)
                {
                    return null;
                }
                newOrder.TotalDiscountPercent = promotion.PromotionId + rank.Discount;
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

                    if (orderDetailDto.AccessoryId != null)
                    {
                        var accessory = _context.Accessories.FirstOrDefault(x =>
                            x.AccessoryId == orderDetailDto.AccessoryId
                        );
                        if (accessory == null)
                        {
                            return null;
                        }
                        accessory.Quantity--;
                        _context.Entry(accessory).State = EntityState.Modified;
                        var materialPrice = _context
                            .MaterialPrices.Where(x => x.Karat == accessory.Karat)
                            .OrderBy(x => x.EffTime)
                            .FirstOrDefault();
                        orderDetail.Accessory = accessory;
                        orderDetail.MaterialPrice = materialPrice;
                        orderDetail.ItemPrice =
                            (
                                diamond.Carat * diamondPrice.UnitPrice * 100
                                + (accessory?.MaterialWeight + (orderDetailDto.Size - 3))
                                    * materialPrice?.UnitPrice
                                + accessory?.AccessoryType.ProcessingPrice
                            ) * priceRate?.Percent;
                    }
                    else
                    {
                        System.Console.WriteLine("No accessory: ");
                        orderDetail.ItemPrice =
                            diamond.Carat * diamondPrice.UnitPrice * 100 * priceRate?.Percent;
                    }
                    var warrantyCard = new WarrantyCard() { OrderDetail = orderDetail };
                    totalPrice += orderDetail.ItemPrice ?? 0;
                    await _context.WarrantyCards.AddAsync(warrantyCard);
                    await _context.OrderDetails.AddAsync(orderDetail);
                    diamond.Availability = false;
                    _context.Entry(diamond).State = EntityState.Modified;
                }
            }
            System.Console.WriteLine("totalPrice: " + totalPrice);
            newOrder.TotalPrice = totalPrice;
            customer.RewardPoint = customer.RewardPoint + (int)(totalPrice / 1000);
            _context.Entry(customer).State = EntityState.Modified;
            await _context.Orders.AddAsync(newOrder);
            await _context.SaveChangesAsync();
            return newOrder;
        }

        //public async Task<OrderDetail?> CreateOrderDetailAsync(CreateOrderDetailDTO order)
        //{
        //    var diamond = _context.Diamonds.FirstOrDefault(x => x.DiamondId == order.DiamondId);
        //    var accessory = _context.Accessories.FirstOrDefault(x =>
        //        x.AccessoryId == order.AccessoryId
        //    );
        //    var materialPrice = _context.MaterialPrices.FirstOrDefault(x =>
        //        x.MaterialPriceId == order.MaterialPriceId
        //    );
        //    var diamondPrice = _context.DiamondPrices.FirstOrDefault(x =>
        //        x.DiamondPriceId == order.DiamondPriceId
        //    );
        //    if (diamond != null && materialPrice != null && diamondPrice != null)
        //    {
        //        var orderDetail = order.ToOrderDetailFromCreate();
        //        orderDetail.Accessory = accessory;
        //        orderDetail.Diamond = diamond;
        //        orderDetail.MaterialPrice = materialPrice;
        //        orderDetail.DiamondPrice = diamondPrice;
        //        await _context.OrderDetails.AddAsync(orderDetail);
        //        await _context.SaveChangesAsync();
        //    }
        //    return null;
        //}

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
                    OrderDetails = x.OrderDetails.Select(y => new OrderDetailDTO
                    {
                        OrderDetailId = y.OrderDetailId,
                        Diamond = y.Diamond != null ? y.Diamond.ToDiamondDTO() : null,
                        DiamondPrice = y.DiamondPrice != null ? y.DiamondPrice.ToDiamondPriceDTO() : null,
                        Accessory = y.Accessory != null ? y.Accessory.ToAccessoryDTO() : null,
                        MaterialPrice = y.MaterialPrice != null ? y.MaterialPrice.ToMaterialPriceDTO() : null,
                        ItemPrice = y.ItemPrice,
                        Size = y.Size,
                        // WarrantyCard = y.WarrantyCard.ToWarrantyCardDTO(),
                    }).ToList(),
                    PriceRate = x.PriceRate != null ? x.PriceRate.ToPriceRateDTO() : null,
                    TotalPrice = x.TotalPrice,
                    TotalDiscountPercent = x.TotalDiscountPercent,
                    OrderStatus = x.OrderStatus.ToString(),
                    ShippingAddress = x.ShippingAddress,
                    CreatedAt = x.CreatedAt,
                    CustomerId = x.CustomerId,
                    CustomerName =x.Customer.Name,
                    SaleStaffId = x.SaleStaffId ?? 0,
                    SaleStaffName = x.SaleStaff != null ? x.SaleStaff.Name : null,
                    DeliveryStaffId = x.DeliveryStaffId ?? 0,
                    DeliveryStaffName = x.DeliveryStaff != null ? x.DeliveryStaff.Name : null,
                    Promotion = x.Promotion,
                    // Transactions = x.Transactions.Select(y => y.ToTransactionDTO()).ToList(),
                    // Feedbacks = x.Feedbacks.Select(y => y.ToFeedbackDTO()).ToList(),
                    })
                .ToListAsync();
            Console.WriteLine("Orders Retrieved: " + orderDTOs.Count);

            return new OrderResult
            {
                Orders = orderDTOs, 
                TotalCount = totalCount,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber,
                TotalPages = totalPages
            };
        }

        public async Task<OrderDTO?> GetOrderByIdAsync(string id)
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
                .Include(x => x.DeliveryStaff)
                .Include(x => x.Customer)
                .Include(x => x.Promotion)
                .FirstOrDefaultAsync(x => x.OrderId.Equals(id));

            var orderDTO = order?.ToOrderDTO();

            if (orderDTO == null)
            {
                return null;
            }

            return orderDTO;
        }

        public async Task<Order?> UpdateOrderAsync(string id, UpdateOrderDTO order)
        {
            var existedOrder = _context.Orders.FirstOrDefault(x => x.OrderId.Equals(id));
            if (existedOrder == null)
            {
                return null;
            }
            if (order.OrderStatus != null)
            {
                existedOrder.OrderStatus = Enum.Parse<OrderStatus>(order.OrderStatus);
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
