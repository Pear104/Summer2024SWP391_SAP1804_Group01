using backend.Crawler;
using backend.Data;
using backend.Models;
using backend.Models.Payment.Domain.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Text.RegularExpressions;

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

        [HttpGet("/seed/metadata")]
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

        [HttpGet("/seed/account")]
        public IActionResult SeedAccount()
        {
            var crawler = new CrawlHelper(_context);
            CrawlHelper.SeedAccount("Crawler\\SeedData\\User.csv");
            //CrawlHelper.SeedAccount("D:\\downloads\\User.csv");
            _context.SaveChanges();
            return Ok("add account ok");
        }

        [HttpGet("/seed/diamond")]
        public async Task<IActionResult> AddDiamond()
        {
            foreach (var shape in _shapes)
            {
                var shapeModel = _context.Shapes.FirstOrDefault(x => x.Name == shape);
                if (shapeModel != null)
                {
                    for (int i = 1; i <= 10; i++)
                    {
                        var diamondList = await CrawlHelper.CrawlDiamond(shapeModel, i);
                        foreach (var diamond in diamondList)
                        {
                            await _context.Diamonds.AddAsync(diamond);
                        }
                    }
                }
            }
            //await _context.SaveChangesAsync();
            //var diamond1 = await _context.Diamonds.FindAsync((long)1);
            //if (diamond1 != null)
            //{
            //    diamond1.ImageUrl = "https://video.diamondasset.in:8080/imagesM/632443228.jpg";
            //}
            //var diamond2 = await _context.Diamonds.FindAsync((long)2);
            //if (diamond2 != null)
            //{
            //    diamond2.ImageUrl = "https://video.diamondasset.in:8080/imagesM/631455159.jpg";
            //}
            //var diamond3 = await _context.Diamonds.FindAsync((long)3);
            //if (diamond3 != null)
            //{
            //    diamond3.ImageUrl = "https://video.diamondasset.in:8080/imagesM/632416490.jpg";
            //}

            //var diamond4 = await _context.Diamonds.FindAsync((long)4);
            //if (diamond4 != null)
            //{
            //    diamond4.ImageUrl = "https://magnifier.s3.us-west-1.amazonaws.com/5493332667.jpg";
            //}
            await _context.SaveChangesAsync();

            return Ok("add diamond ok");
        }

        //[HttpGet("/seed/accessory")]
        //public async Task<IActionResult> AddAccessory()
        //{
        //    List<Accessory> accessories = new List<Accessory>();
        //    //string url =
        //    //"https://www.withclarity.com/products/kite-set-round-lab-created-diamond-solitaire-pendant?variant=46588271591707";
        //    //var accessoryModel = await CrawlHelper.CrawlAccessory(url);
        //    foreach (var accessoryType in _accessory.Keys)
        //    {
        //        var typeModel = _context.AccessoryTypes.FirstOrDefault(x =>
        //            x.Name == accessoryType
        //        );
        //        foreach (var shape in _accessory[accessoryType].Keys)
        //        {
        //            var shapeModel = _context.Shapes.FirstOrDefault(x => x.Name == shape);
        //            foreach (string url in _accessory[accessoryType][shape])
        //            {
        //                var temp = await Crawler.CrawlHelper.CrawlAccessory(url);
        //                var accessoryModel = new Accessory
        //                {
        //                    Name = temp["Name"],
        //                    Karat = RandomKarat(),
        //                    MaterialWeight = float.Parse(temp["Price"]) / (float)56.13,
        //                };
        //                List<AccessoryImage> accessoryImages = new List<AccessoryImage>();
        //                accessoryImages.Add(
        //                    new AccessoryImage { Accessory = accessoryModel, Url = temp["Image"], }
        //                );
        //                if (temp["Image"].Contains("FRONTVIEW_400x"))
        //                {
        //                    accessoryImages.Add(
        //                        new AccessoryImage
        //                        {
        //                            Url = temp["Image"].Replace("FRONTVIEW", "SIDEVIEW"),
        //                        }
        //                    );
        //                }
        //                accessoryModel.AccessoryType =
        //                    typeModel ?? throw new ArgumentNullException(nameof(typeModel));
        //                accessoryModel.Shape =
        //                    shapeModel ?? throw new ArgumentNullException(nameof(shapeModel));
        //                accessoryModel.AccessoryImages = accessoryImages;
        //                // accessories.Add(accessoryModel);
        //                _context.Accessories.Add(accessoryModel);
        //            }
        //        }
        //    }
        //    await _context.SaveChangesAsync();

        //    return Ok("add accessory ok");
        //}

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

        [HttpGet("/seed/accessory")]
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

        [HttpGet("/seed/price")]
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
            CrawlHelper.SeedDiamondPrice("SeedData\\600_799.csv", 6.0f, 7.9999f);
            CrawlHelper.SeedMaterialPrice();
            return Ok("add 5 ok");
        }

        [HttpGet("/seed/payment")]
        public IActionResult Payment()
        {
            var paymentDestination = new PaymentDestination()
            {
                Id = "VNPAY",
                DesLogo = "VNPAY",
                DesShortName = "VNPAY",
                DesName = "VNPAY",
                DesSortIndex = 1,
                IsActive = true,
                CreatedBy = "Admin",
            };
            //	MerchantName	MerchantWebLink	MerchentIpnUrl	MerchantReturnUrl	SecretKey	IsActive	CreatedBy	CreatedAt	LastUpdatedBy	LastUpdateAt
            //MER0001	DatJ	https://localhost:8080	http://localhost:8080/api/payment/vnpay-ipn	http://localhost:3000/	NULL	1	Admin	NULL	NULL	NULL
            var merchant = new Merchant()
            {
                Id = "MER0001",
                MerchantName = "DatJ",
                MerchantWebLink = "https://localhost:8080",
                MerchantIpnUrl = "http://localhost:8080/api/payment/vnpay-ipn",
                MerchantReturnUrl = "http://localhost:3000/",
                IsActive = true,
                CreatedBy = "Admin",
                CreatedAt = DateTime.Now,
                LastUpdateAt = DateTime.Now,
            };
            _context.PaymentDestinations.Add(paymentDestination);
            _context.Merchants.Add(merchant);
            _context.SaveChanges();
            return Ok("add 5 ok");
        }
    }
}
