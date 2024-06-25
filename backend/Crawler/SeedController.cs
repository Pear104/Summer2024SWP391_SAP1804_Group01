using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using backend.Crawler;
using backend.Data;
using backend.Enums;
using backend.Models;
using backend.Models.Payment.Domain.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SeedController : ControllerBase
    {
        public string[] _shapes =
        [
            "Round",
            "Emerald",
            "Heart",
            "Pear",
            "Oval",
            "Cushion",
            "Princess",
            "Radiant",
            "Marquise",
            "Asscher"
        ];

        public string[] RoundPlaceholder =
        [
            "https://video.diamondasset.in:8080/imagesM/632443228.jpg",
            "https://video.diamondasset.in:8080/imagesM/631455159.jpg",
            "https://video.diamondasset.in:8080/imagesM/632416490.jpg",
            "https://magnifier.s3.us-west-1.amazonaws.com/5493332667.jpg"
        ];

        List<Rank> ranks = new List<Rank>
        {
            new Rank
            {
                RankName = "Diamond",
                Discount = 0.15f,
                RewardPoint = 2500
            },
            new Rank
            {
                RankName = "Emerald",
                Discount = 0.125f,
                RewardPoint = 2000
            },
            new Rank
            {
                RankName = "Platinum",
                Discount = 0.1f,
                RewardPoint = 1500
            },
            new Rank
            {
                RankName = "Gold",
                Discount = 0.075f,
                RewardPoint = 1000
            },
            new Rank
            {
                RankName = "Silver",
                Discount = 0.05f,
                RewardPoint = 500
            },
            new Rank
            {
                RankName = "Bronze",
                Discount = 0f,
                RewardPoint = 0
            },
        };

        private static int RandomKarat()
        {
            Random random = new Random();
            int[] karats = { 18, 24 };
            int index = random.Next(karats.Length);
            int randomKarat = karats[index];
            return randomKarat;
        }

        private readonly ApplicationDbContext _context;

        public SeedController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet("metadata")]
        public IActionResult AddShape()
        {
            foreach (string shape in this._shapes)
            {
                var shapeModel = new Shape { Name = shape };
                _context.Shapes.Add(shapeModel);
            }
            Dictionary<string, double> settingTypes = new Dictionary<string, double>
            {
                { "Earrings", 200 },
                { "Necklaces", 400 },
                { "Rings", 150 },
                { "Bracelets", 300 }
            };
            foreach (string settingType in settingTypes.Keys)
            {
                var settingTypeModel = new AccessoryType
                {
                    Name = settingType,
                    ProcessingPrice = settingTypes[settingType]
                };
                _context.AccessoryTypes.Add(settingTypeModel);
            }
            foreach (var rank in ranks)
            {
                _context.Ranks.Add(
                    new Rank()
                    {
                        RankName = rank.RankName,
                        Discount = rank.Discount,
                        RewardPoint = rank.RewardPoint
                    }
                );
            }

            _context.SaveChanges();
            return Ok("add metadata ok");
        }

        [HttpGet("account")]
        public IActionResult SeedAccount()
        {
            var crawler = new CrawlHelper(_context);
            CrawlHelper.SeedAccount("Crawler\\SeedData\\User.csv");
            //CrawlHelper.SeedAccount("D:\\downloads\\User.csv");
            _context.SaveChanges();
            return Ok("add account ok");
        }

        [HttpGet("diamond/{page}")]
        public async Task<IActionResult> AddDiamond([FromRoute] int page)
        {
            foreach (var shape in _shapes)
            {
                var shapeModel = _context.Shapes.FirstOrDefault(x => x.Name == shape);
                if (shapeModel != null)
                {
                    for (int i = (page * 10) + 1; i <= (page + 1) * 10; i++)
                    {
                        var diamondList = await CrawlHelper.CrawlDiamond(shapeModel, i);
                        foreach (var diamond in diamondList)
                        {
                            await _context.Diamonds.AddAsync(diamond);
                        }
                    }
                }
            }
            await _context.SaveChangesAsync();
            return Ok("add diamond ok");
        }

        [HttpGet("clean-diamond-image")]
        public async Task<IActionResult> CleanDiamond()
        {
            var rand = new Random();
            var diamonds = await _context
                .Diamonds.Where(x => x.ImageUrl.Contains("https://v360.diamonds/"))
                .ToListAsync();
            foreach (var diamond in diamonds)
            {
                diamond.ImageUrl = RoundPlaceholder[rand.Next(0, 5)];
            }
            await _context.SaveChangesAsync();
            return Ok("add diamond ok");
        }

        private static string ReplaceCaseInsensitive(
            string input,
            string search,
            string replacement
        )
        {
            string result = Regex.Replace(
                input,
                Regex.Escape(search),
                replacement.Replace("$", "$$"),
                RegexOptions.IgnoreCase
            );
            return result;
        }

        [HttpGet("accessory")]
        public async Task<IActionResult> AddRings()
        {
            var typeModel = _context.AccessoryTypes.FirstOrDefault(x => x.Name == "Rings");
            //var test = new List<Accessory>();
            foreach (string shape in this._shapes)
            {
                var shapeModel =
                    _context.Shapes.FirstOrDefault(x => x.Name == shape)
                    ?? throw new ArgumentNullException();
                var rings = await Crawler.CrawlHelper.CrawlRing(shapeModel);
                foreach (var item in rings)
                {
                    var accessoryModel = new Accessory
                    {
                        Name = item["Name"],
                        Karat = RandomKarat(),
                        MaterialWeight = float.Parse(item["Price"]) / (float)56.13,
                        Quantity = 1000,
                        AccessoryType = typeModel ?? throw new ArgumentNullException(),
                    };
                    ;
                    accessoryModel.Shape = shapeModel;

                    List<AccessoryImage> accessoryImages = new List<AccessoryImage>()
                    {
                        new AccessoryImage { Accessory = accessoryModel, Url = item["Image"], }
                    };
                    bool contains =
                        item["Image"].IndexOf("FRONTVIEW_800x", StringComparison.OrdinalIgnoreCase)
                        >= 0;
                    if (item["Image"].Contains("FRONTVIEW_800x"))
                    {
                        accessoryImages.Add(
                            new AccessoryImage
                            {
                                Url = ReplaceCaseInsensitive(
                                    item["Image"],
                                    "FRONTVIEW",
                                    "SIDEVIEW"
                                ),
                            }
                        );
                        accessoryImages.Add(
                            new AccessoryImage
                            {
                                Url = ReplaceCaseInsensitive(
                                    item["Image"],
                                    "FRONTVIEW",
                                    "PROFILEVIEW"
                                ),
                            }
                        );
                    }
                    else if (item["Image"].Contains("frontview_800x"))
                    {
                        accessoryImages.Add(
                            new AccessoryImage
                            {
                                Url = ReplaceCaseInsensitive(
                                    item["Image"],
                                    "frontview",
                                    "sideview"
                                ),
                            }
                        );
                        accessoryImages.Add(
                            new AccessoryImage
                            {
                                Url = ReplaceCaseInsensitive(
                                    item["Image"],
                                    "frontview",
                                    "profileview"
                                ),
                            }
                        );
                    }
                    accessoryModel.AccessoryImages = accessoryImages;
                    _context.Accessories.Add(accessoryModel);
                    await _context.SaveChangesAsync();
                }
            }
            return Ok("add 4 ok");
        }

        [HttpGet("price")]
        public IActionResult AddPrice()
        {
            float[] percents = [1.0575f, 1.001f, 1.063f, 1.035f, 1.094f, 1.1545f, 1.081f, 1.185f];

            var admin = _context.Accounts.FirstOrDefault(x => x.Name.Contains("Admin"));
            foreach (var percent in percents)
            {
                _context.PriceRates.Add(
                    new PriceRate()
                    {
                        Account = admin ?? throw new ArgumentNullException(),
                        Percent = percent
                    }
                );
                _context.SaveChanges();
            }
            var crawler = new CrawlHelper(_context);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\0_39.csv", 0, 0.3999f);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\40_49.csv", 0.4f, 0.4999f);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\50_69.csv", 0.5f, 0.6999f);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\70_89.csv", 0.7f, 0.8999f);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\90_99.csv", 0.9f, 0.9999f);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\100_149.csv", 1.0f, 1.4999f);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\150_199.csv", 1.5f, 1.9999f);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\200_299.csv", 2.0f, 2.9999f);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\300_399.csv", 3.0f, 3.9999f);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\400_499.csv", 4.0f, 4.9999f);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\500_599.csv", 5.0f, 5.9999f);
            CrawlHelper.SeedDiamondPrice("Crawler\\SeedData\\600_1099.csv", 6.0f, 10.9999f);
            CrawlHelper.SeedMaterialPrice();
            return Ok("add 5 ok");
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
            DateTime minDate = new DateTime(2000, 1, 1);
            DateTime maxDate = new DateTime(2023, 12, 31);
            var createdAt = CrawlHelper.GenerateRandomDate(minDate, maxDate);
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
                var diamondId = rand.Next(1, 2001);
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
                var accessoryId = rand.Next(1, 1305);
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
                (
                    diamond.Carat * diamondPrice.UnitPrice * 100
                    + (accessory?.MaterialWeight + size - 3) * materialPrice?.UnitPrice
                    + accessory?.AccessoryType.ProcessingPrice
                ) * priceRate?.Percent;

            var feedback = new Feedback
            {
                Content = CrawlHelper.GenerateRandomFeedback(),
                Score = rand.Next(1, 6),
                Customer = customer,
                OrderDetail = orderDetail,
                Accessory = accessory,
                CreatedAt = createdAt,
            };

            var warrantyCard = new WarrantyCard() { OrderDetail = orderDetail };
            totalPrice += orderDetail.ItemPrice ?? 0;
            await _context.WarrantyCards.AddAsync(warrantyCard);
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
                long customerId = rand.Next(42, 1001);
                long saleStaffId = rand.Next(7, 16);
                long deliveryStaffId = rand.Next(16, 27);
                await CreateFakeOrderAsync(customerId, saleStaffId, deliveryStaffId);
            }

            return Ok("add fake order ok");
        }
    }
}
