using System.Text.RegularExpressions;
using backend.Crawler;
using backend.Data;
using backend.Enums;
using backend.Helper;
using backend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
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

        public Dictionary<string, Dictionary<string, string[]>> _accessory = new Dictionary<
            string,
            Dictionary<string, string[]>
        >
        {
            {
                "Earrings",
                new Dictionary<string, string[]>
                {
                    {
                        "Round",

                        [
                            "https://www.withclarity.com/products/classic-round-diamond-four-prong-studs-earrings?variant=45132546605339",
                            "https://www.withclarity.com/products/toi-et-moi-round-front-back-earring?variant=47585399931163",
                            "https://www.withclarity.com/products/round-diamond-halo-earrings?variant=46464292159771"
                        ]
                    },
                    {
                        "Princess",

                        [
                            "https://www.withclarity.com/products/classic-princess-brilliant-cut-diamond-martini-stud-earrings?variant=45132532777243",
                            "https://www.withclarity.com/products/princess-diamond-halo-earrings?variant=46466683994395"
                        ]
                    },
                    {
                        "Emerald",

                        [
                            "https://www.withclarity.com/products/toi-et-moi-halo-emeralds-front-back-earring?variant=47585398030619",
                            "https://www.withclarity.com/products/toi-et-moi-round-and-emerald-front-back-earring?variant=47558295257371"
                        ]
                    },
                    {
                        "Oval",

                        [
                            "https://www.withclarity.com/products/oval-created-sapphire-and-lab-diamond-classic-solitaire-under-halo-earrings?variant=47661178978587",
                            "https://www.withclarity.com/products/classic-oval-diamond-stud-earrings?variant=45132519309595"
                        ]
                    },
                    {
                        "Pear",

                        [
                            "https://www.withclarity.com/products/toi-et-moi-halo-round-and-teardrop-front-back-earring?variant=47558280544539",
                            "https://www.withclarity.com/products/elegance-pear-drop-earrings?variant=46915603923227",
                            "https://www.withclarity.com/products/pear-diamond-halo-earring?variant=46466035187995"
                        ]
                    },
                    {
                        "Heart",

                        [
                            "https://www.withclarity.com/products/pear-round-and-heart-matching-earring?variant=48074394501403",
                            "https://www.withclarity.com/products/halo-oval-and-heart-front-back-earring?variant=47781374689563"
                        ]
                    },
                }
            },
            {
                "Necklaces",
                new Dictionary<string, string[]>
                {
                    {
                        "Round",

                        [
                            "https://www.withclarity.com/products/kite-set-round-lab-created-diamond-solitaire-pendant?variant=46588271591707",
                            "https://www.withclarity.com/products/kite-chamfered-bezel-set-solitaire-necklace?variant=45132426379547",
                            "https://www.withclarity.com/products/round-created-ruby-and-lab-diamond-classic-halo-pendant-with-studded-split-bale?variant=47661173440795",
                            "https://www.withclarity.com/products/round-created-sapphire-and-lab-diamond-classic-solitaire-pendant-with-studded-bale?variant=47661167903003"
                        ]
                    },
                    {
                        "Cushion",

                        [
                            "https://www.withclarity.com/products/halo-cushion-lab-created-diamond-necklace?variant=46882526298395",
                            "https://www.withclarity.com/products/classic-cushion-bezel-necklace?variant=48408681546011"
                        ]
                    },
                    {
                        "Heart",

                        [
                            "https://www.withclarity.com/products/classic-heart-bezel-necklace?variant=48409217597723",
                        ]
                    },
                    {
                        "Oval",

                        [
                            "https://www.withclarity.com/products/oval-sapphire-and-lab-diamond-classic-halo-pendant-with-studded-split-bale?variant=45600520634651",
                        ]
                    },
                    {
                        "Pear",

                        [
                            "https://www.withclarity.com/products/pear-created-ruby-and-lab-diamond-classic-halo-pendant-with-studded-split-bale?variant=47661171474715",
                            "https://www.withclarity.com/products/pear-bezel-drop-necklace?variant=48408967053595"
                        ]
                    },
                    {
                        "Emerald",

                        [
                            "https://www.withclarity.com/products/emerald-bezel-drop-necklace?variant=48409146032411"
                        ]
                    },
                }
            },
            {
                "Bracelets",
                new Dictionary<string, string[]>
                {
                    {
                        "Round",

                        [
                            "https://www.withclarity.com/products/round-with-trailing-round-and-marquise-tennis-bracelet?variant=48700537045275",
                            "https://www.withclarity.com/products/round-station-tennis-bracelet?variant=48700533965083"
                        ]
                    },
                    {
                        "Emerald",

                        [
                            "https://www.withclarity.com/products/bezeled-princess-station-with-emeralds-tennis-bracelet?variant=48700563030299",
                            "https://www.withclarity.com/products/half-bezeled-emerald-east-west-tennis-bracelet?variant=48700531081499"
                        ]
                    },
                    {
                        "Oval",

                        [
                            "https://www.withclarity.com/products/half-pave-bezel-bangle?variant=48409312755995",
                            "https://www.withclarity.com/products/oval-with-trailing-round-and-emeralds-tennis-bracelet?variant=48700541305115",
                            "https://www.withclarity.com/products/graduating-oval-tennis-bracelet?variant=48702882251035"
                        ]
                    },
                    {
                        "Heart",

                        [
                            "https://www.withclarity.com/products/half-pave-heart-bangle?variant=48409085837595",
                            "https://www.withclarity.com/products/multi-heart-bezel-bangle?variant=48409563037979",
                            "https://www.withclarity.com/products/bezeled-heart-station-tennis-bracelet?variant=48700538257691",
                        ]
                    },
                    {
                        "Pear",

                        [
                            "https://www.withclarity.com/products/graduating-pear-tennis-bracelet?variant=48700552315163"
                        ]
                    },
                }
            },
        };
        public List<Account> accounts = new List<Account>
        {
            new Account
            {
                Role = Role.Customer,
                RankId = 1,
                Name = "ToiLaCustomer",
                Email = "customer@gmail.com",
                Password = "12345678",
                PhoneNumber = "0123456789",
                Address = "120 ABC Street",
            },
            new Account
            {
                Role = Role.SaleStaff,
                RankId = 2,
                Name = "ToiLaSaleStaff",
                Email = "sale_staff@gmail.com",
                Password = "12345678",
                PhoneNumber = "0123456785",
                Address = "23 AC Street",
            },
            new Account
            {
                Role = Role.DeliveryStaff,
                RankId = 3,
                Name = "ToiLaDeliverystaff",
                Email = "delivery_staff@gmail.com",
                Password = "12345678",
                PhoneNumber = "0123456783",
                Address = "12 BC Street",
            },
            new Account
            {
                Role = Role.Manager,
                RankId = 5,
                Name = "ToiLaManager",
                Email = "manager@gmail.com",
                Password = "12345678",
                PhoneNumber = "0123456789",
                Address = "13 AC Street",
            },
            new Account
            {
                Role = Role.Administrator,
                RankId = 6,
                Name = "ToiLaAdministrator",
                Email = "administrator@gmail.com",
                Password = "12345678",
                PhoneNumber = "0123456789",
                Address = "213 BAC Street",
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

        [HttpGet("/seed/account")]
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

            foreach (var account in accounts)
            {
                var rank = _context.Ranks.Find(account.RankId);
                var hashedPassword = PasswordHasher.HashPassword(account.Password);
                account.Password = hashedPassword;
                account.Rank = rank;
                _context.Accounts.Add(account);
            }

            _context.SaveChanges();
            return Ok("add 1 ok");
        }

        [HttpGet("/seed/diamond")]
        public async Task<IActionResult> AddDiamond()
        {
            foreach (var shape in _shapes)
            {
                var shapeModel = _context.Shapes.FirstOrDefault(x => x.Name == shape);
                var diamondList = await CrawlHelper.CrawlDiamond(shapeModel);
                foreach (var diamond in diamondList)
                {
                    await _context.Diamonds.AddAsync(diamond);
                }
            }
            await _context.SaveChangesAsync();
            var diamond1 = await _context.Diamonds.FindAsync((long)1);
            diamond1.ImageUrl = "https://video.diamondasset.in:8080/imagesM/632443228.jpg";
            var diamond2 = await _context.Diamonds.FindAsync((long)2);
            diamond2.ImageUrl = "https://video.diamondasset.in:8080/imagesM/631455159.jpg";
            var diamond3 = await _context.Diamonds.FindAsync((long)3);
            diamond3.ImageUrl = "https://video.diamondasset.in:8080/imagesM/632416490.jpg";
            var diamond4 = await _context.Diamonds.FindAsync((long)4);
            diamond4.ImageUrl = "https://magnifier.s3.us-west-1.amazonaws.com/5493332667.jpg";
            await _context.SaveChangesAsync();

            return Ok("add 2 ok");
        }

        [HttpGet("/seed/accessory")]
        public async Task<IActionResult> AddAccessory()
        {
            List<Accessory> accessories = new List<Accessory>();
            //string url =
            //"https://www.withclarity.com/products/kite-set-round-lab-created-diamond-solitaire-pendant?variant=46588271591707";
            //var accessoryModel = await CrawlHelper.CrawlAccessory(url);
            foreach (var accessoryType in _accessory.Keys)
            {
                var typeModel = _context.AccessoryTypes.FirstOrDefault(x =>
                    x.Name == accessoryType
                );
                foreach (var shape in _accessory[accessoryType].Keys)
                {
                    var shapeModel = _context.Shapes.FirstOrDefault(x => x.Name == shape);
                    foreach (string url in _accessory[accessoryType][shape])
                    {
                        var temp = await Crawler.CrawlHelper.CrawlAccessory(url);
                        var accessoryModel = new Accessory
                        {
                            Name = temp["Name"],
                            Karat = RandomKarat(),
                            MaterialWeight = float.Parse(temp["Price"]) / (float)56.13,
                        };
                        List<AccessoryImage> accessoryImages = new List<AccessoryImage>();
                        accessoryImages.Add(
                            new AccessoryImage { Accessory = accessoryModel, Url = temp["Image"], }
                        );
                        if (temp["Image"].Contains("FRONTVIEW_400x"))
                        {
                            accessoryImages.Add(
                                new AccessoryImage
                                {
                                    Url = temp["Image"].Replace("FRONTVIEW", "SIDEVIEW"),
                                }
                            );
                        }
                        accessoryModel.AccessoryType = typeModel;
                        accessoryModel.Shape = shapeModel;
                        accessoryModel.AccessoryImages = accessoryImages;
                        //accessories.Add(accessoryModel);
                        _context.Accessories.Add(accessoryModel);
                    }
                }
            }
            await _context.SaveChangesAsync();

            return Ok("add 3 ok");
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

        [HttpGet("/seed/ring-accessory")]
        public async Task<IActionResult> AddRings()
        {
            var typeModel = _context.AccessoryTypes.FirstOrDefault(x => x.Name == "Rings");
            //var test = new List<Accessory>();
            foreach (string shape in this._shapes)
            {
                var shapeModel = _context.Shapes.FirstOrDefault(x => x.Name == shape);
                var rings = await Crawler.CrawlHelper.CrawlRing(shapeModel);
                foreach (var item in rings)
                {
                    var accessoryModel = new Accessory
                    {
                        Name = item["Name"],
                        Karat = RandomKarat(),
                        MaterialWeight = float.Parse(item["Price"]) / (float)56.13,
                    };
                    accessoryModel.AccessoryType = typeModel;
                    accessoryModel.Shape = shapeModel;

                    List<AccessoryImage> accessoryImages = new List<AccessoryImage>();
                    accessoryImages.Add(
                        new AccessoryImage { Accessory = accessoryModel, Url = item["Image"], }
                    );
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

        //[HttpGet("/crawler/5")]
        //public IActionResult AddPriceRate()
        //{
        //    float[] percents = [105.75f, 100.1f, 106.3f, 103.5f, 109.4f, 115.45f, 98.1f, 118.5f];

        //    var admin = _context.Accounts.FirstOrDefault(x => x.Name == "ToiLaAdministrator");
        //    foreach (var percent in percents)
        //    {
        //        _context.PriceRates.Add(new PriceRate() { Account = admin, Percent = percent });
        //        _context.SaveChanges();
        //    }
        //    return Ok("add 5 ok");
        //}

        [HttpGet("/seed/price")]
        public IActionResult AddPrice()
        {
            float[] percents = [105.75f, 100.1f, 106.3f, 103.5f, 109.4f, 115.45f, 98.1f, 118.5f];

            var admin = _context.Accounts.FirstOrDefault(x => x.Name == "ToiLaAdministrator");
            foreach (var percent in percents)
            {
                _context.PriceRates.Add(new PriceRate() { Account = admin, Percent = percent });
                _context.SaveChanges();
            }
            var crawler = new CrawlHelper(_context);
            CrawlHelper.SeedDiamondPrice("SeedData\\0_39.csv", 0, 0.3999f);
            CrawlHelper.SeedDiamondPrice("SeedData\\40_49.csv", 0.4f, 0.4999f);
            CrawlHelper.SeedDiamondPrice("SeedData\\50_69.csv", 0.5f, 0.6999f);
            CrawlHelper.SeedDiamondPrice("SeedData\\70_89.csv", 0.7f, 0.8999f);
            CrawlHelper.SeedDiamondPrice("SeedData\\90_99.csv", 0.9f, 0.9999f);
            CrawlHelper.SeedDiamondPrice("SeedData\\100_149.csv", 1.0f, 1.4999f);
            CrawlHelper.SeedDiamondPrice("SeedData\\150_199.csv", 1.5f, 1.9999f);
            CrawlHelper.SeedDiamondPrice("SeedData\\200_299.csv", 2.0f, 2.9999f);
            CrawlHelper.SeedDiamondPrice("SeedData\\300_399.csv", 3.0f, 3.9999f);
            CrawlHelper.SeedDiamondPrice("SeedData\\400_499.csv", 4.0f, 4.9999f);
            CrawlHelper.SeedDiamondPrice("SeedData\\500_599.csv", 5.0f, 5.9999f);
            CrawlHelper.SeedMaterialPrice();
            return Ok("add 5 ok");
        }

        [HttpGet("/seed/order")]
        public async Task<IActionResult> AddOrder()
        {
            var customer = await _context
                .Accounts.Include(x => x.Rank)
                .FirstOrDefaultAsync(x => x.Email == "customer@gmail.com");
            var saleStaff = await _context.Accounts.FirstOrDefaultAsync(x =>
                x.Email == "sale_staff@gmail.com"
            );
            var deliveryStaff = await _context.Accounts.FirstOrDefaultAsync(x =>
                x.Email == "delivery_staff@gmail.com"
            );

            var order = new Order()
            {
                Customer = customer,
                SaleStaff = saleStaff,
                DeliveryStaff = deliveryStaff,
                Rank = customer.Rank,
                PriceRate = await _context
                    .PriceRates.OrderByDescending(x => x.CreatedAt)
                    .FirstOrDefaultAsync(),
                ShippingAddress = customer.Address,
                PhoneNumber = customer.PhoneNumber,
                OrderStatus = OrderStatus.Pending,
            };

            var diamond = await _context.Diamonds.FindAsync((long)12);
            var accessory = await _context
                .Accessories.Include(x => x.AccessoryType)
                .FirstOrDefaultAsync(x => x.AccessoryId == 34);
            var orderDetail = new OrderDetail
            {
                Size = 3.5f,
                Diamond = diamond,
                Accessory = accessory,
                DiamondPrice = await _context
                    .DiamondPrices.OrderByDescending(x => x.EffTime)
                    .FirstOrDefaultAsync(x =>
                        x.Clarity == diamond.Clarity
                        && x.Color == diamond.Color
                        && diamond.Carat <= x.MaxCaratEff
                        && diamond.Carat >= x.MinCaratEff
                    ),
                MaterialPrice = await _context
                    .MaterialPrices.OrderByDescending(x => x.EffTime)
                    .FirstOrDefaultAsync(x => x.Karat == accessory.Karat),
                Order = order,
            };
            orderDetail.ItemPrice =
                orderDetail.DiamondPrice.UnitPrice * diamond.Carat
                + orderDetail.MaterialPrice.UnitPrice * accessory.MaterialWeight
                + accessory.AccessoryType.ProcessingPrice;
            order.OrderDetails = new List<OrderDetail> { orderDetail };
            order.TotalPrice = order.OrderDetails.Sum(x => x.ItemPrice) * order.PriceRate.Percent;

            var warrantyCard = new WarrantyCard();
            orderDetail.WarrantyCard = warrantyCard;

            await _context.Orders.AddAsync(order);
            await _context.OrderDetails.AddAsync(orderDetail);
            await _context.WarrantyCards.AddAsync(warrantyCard);

            _context.SaveChangesAsync();

            return Ok("add 6 ok");
        }
    }
}
