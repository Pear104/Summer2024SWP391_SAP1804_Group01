using BusinessObjects.Enums;
using BusinessObjects.Models;
using DAOs;
using Helpers.HelperClasses;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ZSeedController : ControllerBase
    {
        private readonly ApplicationDbContext _context = new ApplicationDbContext();

        [HttpGet]
        public async Task<ActionResult> Get()
        {
            var diamonds = await _context.Diamonds.ToListAsync();
            var priceRate = await _context
                .PriceRates.OrderByDescending(x => x.CreatedAt)
                .FirstOrDefaultAsync();
            var random = new Random();
            foreach (var diamond in diamonds)
            {
                var diamondPrice = _context
                    .DiamondPrices.Where(x =>
                        x.Clarity == diamond.Clarity
                        && x.Color == diamond.Color
                        && x.MinCaratEff <= diamond.Carat
                        && x.MaxCaratEff >= diamond.Carat
                    )
                    .OrderBy(x => x.EffTime)
                    .FirstOrDefault();
                diamond.ImportPrice = PriceHelper.GetDiamondPrice(
                    diamond.Carat,
                    Math.Abs(diamondPrice.UnitPrice - random.Next(0, 100)),
                    priceRate.Percent
                );

                _context.Entry(diamond).State = EntityState.Modified;
                await _context.SaveChangesAsync();
            }
            return Ok("Hello World");
        }

        [HttpGet("fake-order")]
        public async Task<Order?> CreateFakeOrderAsync(long cusId, long saleId, long deliveryId)
        {
            Random rand = new Random();
            // long customerId = rand.Next(42, 1001);
            // long saleStaffId = rand.Next(7, 16);
            // long deliveryStaffId = rand.Next(16, 27);
            var customer = await _context.Accounts.FindAsync(cusId);
            var saleStaff = await _context.Accounts.FindAsync(saleId);
            var deliveryStaff = await _context.Accounts.FindAsync(deliveryId);
            var rank = await _context.Ranks.FindAsync(customer.RankId);
            var priceRate = await _context
                .PriceRates.OrderByDescending(x => x.CreatedAt)
                .FirstOrDefaultAsync();
            Promotion? promotion = null;
            if (rank == null || priceRate == null)
            {
                return null;
            }
            DateTime minDate = new DateTime(2018, 1, 1);
            DateTime maxDate = new DateTime(2024, 7, 31);
            var createdAt = SeedHelper.GenerateRandomDate(minDate, maxDate);
            var newOrder = new Order()
            {
                OrderId = DateTime.Now.Ticks.ToString(),
                Customer = customer,
                Rank = rank,
                PriceRate = priceRate,
                OrderStatus = OrderStatus.Completed,
                ShippingAddress = customer.Address,
                PhoneNumber = customer.PhoneNumber,
                CreatedAt = createdAt,
                SaleStaff = saleStaff,
                DeliveryStaff = deliveryStaff,
            };

            double totalPrice = 0;
            Diamond diamond = null;
            long shapeId = 0;
            while (diamond == null)
            {
                var diamondId = rand.Next(1, 13429);
                diamond = _context.Diamonds.FirstOrDefault(x =>
                    x.DiamondId == diamondId && x.Availability == true
                );
                if (diamond == null)
                    continue;
                shapeId = diamond.ShapeId;
            }

            Accessory accessory = null;
            while (accessory == null)
            {
                var accessoryId = rand.Next(1, 2215);
                accessory = _context
                    .Accessories.Include(x => x.AccessoryType)
                    .FirstOrDefault(x =>
                        x.AccessoryId == accessoryId && x.Quantity > 0 && shapeId == x.ShapeId
                    );
            }

            var size = rand.Next(3, 6);

            var diamondPrice = _context
                .DiamondPrices.Where(x =>
                    x.Clarity == diamond.Clarity
                    && x.Color == diamond.Color
                    && x.MinCaratEff <= diamond.Carat
                    && x.MaxCaratEff >= diamond.Carat
                )
                .OrderBy(x => x.EffTime)
                .FirstOrDefault();

            var materialPrice = _context
                .MaterialPrices.OrderByDescending(x => x.EffTime)
                .Where(x => x.Karat == accessory.Karat)
                .FirstOrDefault();

            var orderDetail = new OrderDetail
            {
                Size = size,
                Order = newOrder,
                Diamond = diamond,
                DiamondPrice = diamondPrice,
                Accessory = accessory,
                MaterialPrice = materialPrice,
            };

            accessory.Quantity--;
            _context.Entry(accessory).State = EntityState.Modified;

            orderDetail.ItemPrice =
                PriceHelper.GetDiamondPrice(
                    diamond.Carat,
                    diamondPrice.UnitPrice,
                    priceRate.Percent
                )
                + PriceHelper.GetAccessoryPrice(
                    accessory.MaterialWeight,
                    size,
                    materialPrice.UnitPrice,
                    accessory.AccessoryType.ProcessingPrice,
                    priceRate.Percent
                );

            var feedback = new Feedback
            {
                Content = SeedHelper.GenerateRandomFeedback(),
                Score = rand.Next(1, 6),
                Customer = customer,
                OrderDetail = orderDetail,
                Accessory = accessory,
                CreatedAt = createdAt,
            };

            var warrantyCardDiamond = new WarrantyCard()
            {
                OrderDetail = orderDetail,
                Diamond = diamond,
                StartTime = createdAt,
                EndTime = createdAt.AddYears(2),
            };
            var warrantyCardAccessory = new WarrantyCard()
            {
                OrderDetail = orderDetail,
                Accessory = accessory,
                StartTime = createdAt,
                EndTime = createdAt.AddYears(1),
            };
            totalPrice += orderDetail.ItemPrice ?? 0;
            await _context.WarrantyCards.AddAsync(warrantyCardDiamond);
            await _context.WarrantyCards.AddAsync(warrantyCardAccessory);
            await _context.OrderDetails.AddAsync(orderDetail);
            diamond.Availability = false;
            _context.Entry(diamond).State = EntityState.Modified;
            newOrder.TotalPrice = totalPrice;
            customer.RewardPoint = customer.RewardPoint + (int)(totalPrice / 1000);
            _context.Entry(customer).State = EntityState.Modified;
            await _context.Orders.AddAsync(newOrder);
            var transaction = new Transaction()
            {
                TransactionId = $"ORD{newOrder.OrderId}-TRS{DateTime.Now.Ticks.ToString()}",
                Order = newOrder,
                PaymentMethod = rand.Next(0, 2) == 0 ? "CREDIT_CARD" : "SHIP_COD",
                Amount = newOrder.TotalPrice,
                TransactionStatus = TransactionStatus.Completed,
                CreatedAt = createdAt,
            };
            await _context.Transactions.AddAsync(transaction);
            await _context.Feedbacks.AddAsync(feedback);

            await _context.SaveChangesAsync();
            return newOrder;
        }

        [HttpGet("fake-orders/{number}")]
        public async Task<IActionResult> CreateFakeOrdersAsync(int number)
        {
            for (int i = 0; i < number; i++)
            {
                Random rand = new Random();
                long customerId = rand.Next(42, 3007);
                long saleStaffId = rand.Next(7, 16);
                long deliveryStaffId = rand.Next(16, 27);
                await CreateFakeOrderAsync(customerId, saleStaffId, deliveryStaffId);
            }

            return Ok("add fake order ok");
        }
    }
}
