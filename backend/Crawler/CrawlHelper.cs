using backend.Data;
using backend.Enums;
using backend.Helper;
using backend.Models;
using HtmlAgilityPack;
using Microsoft.VisualBasic.FileIO;
using Newtonsoft.Json;
using OpenQA.Selenium;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Interactions;
using System.Text;

namespace backend.Crawler
{
    public class CrawlHelper
    {
        private static ApplicationDbContext _context;

        public CrawlHelper(ApplicationDbContext context)
        {
            _context = context;
        }

        private static async Task<HtmlDocument?> GetAndLoadHtml(string url)
        {
            HttpClientHandler clientHandler = new HttpClientHandler();
            clientHandler.ServerCertificateCustomValidationCallback = (
                sender,
                cert,
                chain,
                sslPolicyErrors
            ) =>
            {
                return true;
            };
            HttpClient client = new HttpClient(clientHandler);
            client.DefaultRequestHeaders.Add(
                "User-Agent",
                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
            );

            try
            {
                string html = await client.GetStringAsync(url);
                var doc = new HtmlDocument();
                doc.LoadHtml(html);
                return doc;
            }
            catch (HttpRequestException ex)
            {
                Console.WriteLine($"Request error: {ex.Message}");
                return null;
            }
        }

        public static async Task<List<Models.Diamond>> CrawlDiamond(Shape shapeModel, int page)
        {
            HttpClientHandler clientHandler = new HttpClientHandler();
            clientHandler.ServerCertificateCustomValidationCallback = (
                sender,
                cert,
                chain,
                sslPolicyErrors
            ) =>
            {
                return true;
            };
            var url = "https://vportalwithclarity.com/fetchdirectdiamond/";
            var payload = new
            {
                filter = new object[]
                {
                    new { shapes = new[] { shapeModel.Name } },
                    new { cuts = new[] { 0, 1, 2, 3, 4 } },
                    new { colors = new[] { 0, 1, 2, 3, 4, 5, 6, 7, 8 } },
                    new { claritys = new[] { 0, 1, 2, 3, 4, 5, 6, 7, 8 } },
                    new { labs = new int[] { } },
                    new { polish = new[] { 0, 1, 2, 3 } },
                    new { symmetrys = new[] { 0, 1, 2, 3 } },
                    new { price = "100.00,700000.00" },
                    new { carat = "0.25,20.00" },
                    new { page = 1 },
                    new { orderBy = "Shape" },
                    new { sortBy = "ASC" },
                    new { lwratio = "0.9,2.75" },
                    new { fluorescences = new[] { 0, 1, 2, 3 } },
                    new { sku = "" },
                    new { table = "40,90" },
                    new { depth = "40,90" },
                    new { type = "" },
                    new { diamond_type = "lab" },
                    new { cert_num = "" },
                    new { quick_ship_diamonds = "N" },
                    new { Appointment = "" },
                    new { VaultDiscount = "No" },
                    new { reports = "" },
                    new { color_intensity = new int[] { } }
                }
            };
            var jsonPayload = System.Text.Json.JsonSerializer.Serialize(payload);
            List<Models.Diamond> diamondList = new List<Models.Diamond>();
            using (var httpClient = new HttpClient(clientHandler))
            {
                httpClient.DefaultRequestHeaders.Add("Origin", "https://www.withclarity.com");
                httpClient.DefaultRequestHeaders.Referrer = new Uri("https://www.withclarity.com/");
                var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(url, content);
                var responseContent = await response.Content.ReadAsStringAsync();
                var root = JsonConvert.DeserializeObject<CrawlClasses.Root>(responseContent);
                foreach (CrawlClasses.Diamond diamond in root.data.liveDiamondData.diamond)
                {
                    Models.Diamond diamondModel = new Models.Diamond
                    {
                        Carat = (float)diamond.size,
                        Cut = diamond.cut,
                        Clarity = (Clarity)Enum.Parse(typeof(Clarity), diamond.clarity),
                        Color = (Color)Enum.Parse(typeof(Color), diamond.color),
                        Polish = diamond.polish,
                        Symmetry = diamond.symmetry,
                        Fluorescence = diamond.fluor_intensity,
                        CertificateNumber = long.Parse(diamond.cert_num),
                        CertificateUrl = diamond.cert_url,
                        ImageUrl = diamond.image_file_url,
                        Availability = true,
                        ShapeId = shapeModel.ShapeId,
                        Lab = diamond.lab,
                        Shape = shapeModel
                    };
                    diamondList.Add(diamondModel);
                }
            }
            return diamondList;
        }

        public static async Task<Dictionary<string, string>> CrawlAccessory(string url)
        {
            var doc = await GetAndLoadHtml(url);
            string name = doc
                .DocumentNode.SelectSingleNode("//*[@class=\"product-single__title\"]")
                .InnerText.Trim();
            string price = doc
                .DocumentNode.SelectSingleNode("//*[@class=\"price__on-sale\"]")
                .InnerText.Trim()
                .Replace("$", "");
            var images = doc.DocumentNode.SelectNodes(
                "//*[@class=\"product-single__media\"]/div/img"
            );
            string mainImage = "";
            foreach (var image in images)
            {
                if (image.GetAttributeValue("alt", "").Contains("Yellow Gold"))
                {
                    mainImage = image.GetAttributeValue("data-src", "");
                    mainImage = mainImage.Replace("{width}", "400");
                    break;
                }
            }
            return new Dictionary<string, string>
            {
                { "Name", name },
                { "Price", price },
                { "Image", mainImage }
            };
        }

        public static async Task<List<Dictionary<string, string>>> CrawlRing(Shape shapeModel)
        {
            using (EdgeDriver driver = new EdgeDriver())
            {
                try
                {
                    string url =
                        $"https://www.withclarity.com/collections/engagement-rings?q={shapeModel.Name},14KT_Yellow_Gold";
                    driver.Navigate().GoToUrl(url);
                    var loader = driver.FindElement(
                        By.CssSelector("#page_contnt-info_section > div > div.section-header > h2"),
                        20
                    );
                    for (int i = 0; i <= 10; i++)
                    {
                        Actions actions = new Actions(driver);
                        actions.MoveToElement(loader);
                        actions.Perform();
                    }
                    Thread.Sleep(1000);

                    var items = driver.FindElements(By.ClassName("product-card"), 20);

                    var result = new List<Dictionary<string, string>>();
                    foreach (IWebElement element in items)
                    {
                        try
                        {
                            var mainImage = element
                                .FindElement(By.CssSelector("div.product-image-wrapper > a > img"))
                                .GetAttribute("src")
                                .Trim();
                            var price = element
                                .FindElement(By.ClassName("price-item"))
                                .Text.Replace("$", "")
                                .Trim();
                            var name = element
                                .FindElement(By.CssSelector(".product-card__title"))
                                .Text.Trim();

                            await Console.Out.WriteLineAsync(mainImage);
                            await Console.Out.WriteLineAsync(price);
                            await Console.Out.WriteLineAsync(name);

                            result.Add(
                                new Dictionary<string, string>
                                {
                                    { "Name", name },
                                    { "Price", price },
                                    { "Image", mainImage }
                                }
                            );
                        }
                        catch (NoSuchElementException ex)
                        {
                            // Handle the case where an element is not found
                            Console.WriteLine("Element not found: " + ex.Message);
                        }
                    }

                    return result;
                }
                finally
                {
                    driver.Quit();
                }
            }
        }

        public static void SeedDiamondPrice(string filepath, float minCt, float maxCt)
        {
            string filePath = filepath;
            string[] colors = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M"];
            string[] clarities =
            [
                "FL",
                "IF",
                "VVS1",
                "VVS2",
                "VS1",
                "VS2",
                "SI1",
                "SI2",
                "SI3",
                "I1",
                "I2",
                "I3",
            ];
            Dictionary<string, Dictionary<string, string>> data =
                new Dictionary<string, Dictionary<string, string>>();

            using (TextFieldParser parser = new TextFieldParser(filePath))
            {
                parser.TextFieldType = FieldType.Delimited;
                parser.SetDelimiters(",");

                string[] headers = parser.ReadFields(); // Read the header row

                while (!parser.EndOfData)
                {
                    string[] fields = parser.ReadFields();

                    Dictionary<string, string> rowData = new Dictionary<string, string>();

                    for (int i = 1; i < fields.Length; i++)
                    {
                        rowData[headers[i]] = fields[i];
                    }

                    data[fields[0]] = rowData;
                }
                Console.WriteLine(string.Join("\t", headers)); // Print the header row

                foreach (var color in colors)
                {
                    foreach (var clarity in clarities)
                    {
                        Console.Write(data[color][clarity] + "\t");
                        var diamondPrice = new DiamondPrice()
                        {
                            Clarity = (Clarity)Enum.Parse(typeof(Clarity), clarity),
                            Color = (Color)Enum.Parse(typeof(Color), color),
                            UnitPrice = double.Parse(data[color][clarity]),
                            MinCaratEff = minCt,
                            MaxCaratEff = maxCt
                        };
                        _context.DiamondPrices.Add(diamondPrice);
                    }
                    Console.WriteLine();
                }
                _context.SaveChanges();
                //Console.WriteLine(data["D"]["IF"]);
            }
        }

        public static void SeedAccount(string filepath)
        {
            string filePath = filepath;
            var rank = _context.Ranks.FirstOrDefault(x => x.RankName == "Bronze");
            using (TextFieldParser parser = new TextFieldParser(filePath))
            {
                parser.TextFieldType = FieldType.Delimited;
                parser.SetDelimiters(",");

                string[] headers = parser.ReadFields(); // Read the header row
                while (!parser.EndOfData)
                {
                    string[] fields = parser.ReadFields();
                    var rand = new Random().Next(0, 3);
                    var gender = Gender.Female;
                    switch (rand)
                    {
                        case 0:
                            gender = Gender.Male;
                            break;
                        case 1:
                            gender = Gender.Female;
                            break;
                        case 2:
                            gender = Gender.Other;
                            break;
                        default:
                            gender = Gender.Female;
                            break;
                    }
                    var role = Role.Customer;
                    switch (fields[5])
                    {
                        case "1":
                            role = Role.Customer;
                            break;
                        case "2":
                            role = Role.SaleStaff;
                            break;
                        case "3":
                            role = Role.DeliveryStaff;
                            break;
                        case "4":
                            role = Role.WarrantyStaff;
                            break;
                        case "5":
                            role = Role.Manager;
                            break;
                        case "6":
                            role = Role.Administrator;
                            break;
                    }
                    _context.Accounts.Add(
                        new Account()
                        {
                            Rank = rank,
                            Name = fields[0],
                            Email = fields[1],
                            PhoneNumber = fields[2],
                            Address = fields[3],
                            Birthday = DateTime.Parse(fields[4]),
                            Role = role,
                            Gender = gender,
                            Password = PasswordHasher.HashPassword("12345678"),
                        }
                    );
                }
                _context.SaveChanges();
                //Console.WriteLine(data["D"]["IF"]);
            }
        }

        public static void SeedMaterialPrice()
        {
            double[] materialPrices18k = [75.75f, 78f, 73.3f, 71.5f, 72.4f, 77.95f, 80.1f, 81.5f];
            double[] materialPrices24k = [83.75f, 87.1f, 86.3f, 85.5f, 89.4f, 90.45f, 88.1f, 88.5f];
            foreach (var materialPrice in materialPrices18k)
            {
                var price = new MaterialPrice() { UnitPrice = materialPrice, Karat = 18, };
                _context.MaterialPrices.Add(price);
            }

            foreach (var materialPrice in materialPrices24k)
            {
                var price = new MaterialPrice() { UnitPrice = materialPrice, Karat = 24, };
                _context.MaterialPrices.Add(price);
            }
            _context.SaveChanges();
        }
    }
}
