using backend.Models;
using HtmlAgilityPack;
using Newtonsoft.Json;
using OpenQA.Selenium;
using OpenQA.Selenium.Edge;
using System.Text;

namespace backend.Crawler
{
    public class CrawlHelper
    {
        private static async Task<HtmlDocument?> GetAndLoadHtml(string url)
        {
            HttpClient client = new HttpClient();
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

        public static async Task<List<Models.Diamond>> CrawlDiamond(Shape shapeModel)
        {
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
            using (var httpClient = new HttpClient())
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
                        Clarity = diamond.clarity,
                        Color = diamond.color,
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
                    Thread.Sleep(6000);
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
    }
}
