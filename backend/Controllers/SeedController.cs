using backend.Data;
using backend.Models;
using HtmlAgilityPack;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Text;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SeedController : ControllerBase
    {
        public string[] _shapes = [
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

        public string[] _materials = [
            "14KT White Gold",
            "14KT Yellow Gold",
            "14KT Rose Gold",
            "18KT White Gold",
            "18KT Yellow Gold",
            "18KT Rose Gold",
            "14KT White & Yellow Gold",
            "14KT White & Rose Gold",
            "18KT White & Yellow Gold",
            "18KT White & Rose Gold"
        ];

        public class Diamond
        {
            public string diamond_name { get; set; }
            public string Appointment { get; set; }
            public string QuickShip { get; set; }
            public int bank_wire_price_in_currency { get; set; }
            public string cert_num { get; set; }
            public string cert_url { get; set; }
            public string city { get; set; }
            public string clarity { get; set; }
            public string color { get; set; }
            public string country { get; set; }
            public string culet_condition { get; set; }
            public string culet_size { get; set; }
            public string currency_code { get; set; }
            public string currency_symbol { get; set; }
            public string current_diamond_type { get; set; }
            public string cut { get; set; }
            public string depth_percent { get; set; }
            public string diamondQuantity { get; set; }
            public string diamond_feed { get; set; }
            public string diamond_id { get; set; }
            public string diamond_type { get; set; }
            public int discount_perc { get; set; }
            public string eye_clean { get; set; }
            public string fluor_color { get; set; }
            public string fluor_intensity { get; set; }
            public string girdle_condition { get; set; }
            public string girdle_max { get; set; }
            public string girdle_min { get; set; }
            public bool has_cert_file { get; set; }
            public bool has_image_file { get; set; }
            public bool has_sarineloupe { get; set; }
            public bool has_video_file { get; set; }
            public string image_file_url { get; set; }
            public string image_url { get; set; }
            public string inserted_on { get; set; }
            public string lab { get; set; }
            public double meas_depth { get; set; }
            public double meas_length { get; set; }
            public double meas_width { get; set; }
            public string measurements { get; set; }
            public string polish { get; set; }
            public string ratio { get; set; }
            public string retail_price { get; set; }
            public string sellerName { get; set; }
            public string shape { get; set; }
            public double size { get; set; }
            public string special_price { get; set; }
            public string state { get; set; }
            public string steps_image_url { get; set; }
            public string stock_num { get; set; }
            public string symmetry { get; set; }
            public string table_percent { get; set; }
            public int total_discounted_sales_price { get; set; }
            public string total_discounted_sales_price_in_currency { get; set; }
            public string total_discounted_sales_price_without_currency_symbol { get; set; }
            public int total_sales_price { get; set; }
            public string total_sales_price_in_currency { get; set; }
            public string total_sales_price_without_currency_symbol { get; set; }
            public string vaultDiscount { get; set; }
            public string video_file_url { get; set; }
            public string video_file_url_insecure { get; set; }
            public string video_url { get; set; }
        }

        public class LiveDiamondData
        {
            public int originalCount { get; set; }
            public int dataCount { get; set; }
            public string diamondsReturned { get; set; }
            public string pageNo { get; set; }
            public List<Diamond> diamond { get; set; }
        }

        public class Data
        {
            public LiveDiamondData liveDiamondData { get; set; }
        }

        public class Root
        {
            public Data data { get; set; }
        }

        private readonly ApplicationDbContext _context;
        public SeedController(ApplicationDbContext context)
        {
            _context = context;
        }

        private async Task<HtmlDocument?> GetAndLoadHtml(string url)
        {
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");

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

        [HttpGet("/test")]
        public async Task<IActionResult> Test()
        {
            //await GetAndLoadHtml();
            return Ok("ahihi");
        }

        [HttpGet("/diamond")]
        public async Task<IActionResult> AddDiamond()
        {
            var url = "https://vportalwithclarity.com/fetchdirectdiamond/";

            // Create the JSON payload
            var payload = new
            {
                filter = new object[]
                {
                new { shapes = new[] { "Round" } },
                new { cuts = new[] { 0, 1, 2, 3, 4 } },
                new { colors = new[] { 0, 1, 2, 3, 4, 5, 6, 7, 8 } },
                new { claritys = new[] { 0, 1, 2, 3, 4, 5, 6, 7, 8 } },
                new { labs = new int[] { } },
                new { polish = new[] { 0, 1, 2, 3 } },
                new { symmetrys = new[] { 0, 1, 2, 3 } },
                new { price = "100.00,700000.00" },
                new { carat = "0.25,20.00" },
                new { page = 2 },
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

            // Serialize the payload to JSON
            var jsonPayload = System.Text.Json.JsonSerializer.Serialize(payload);

            // Set up the HttpClient
            using (var httpClient = new HttpClient())
            {
                // Set up the headers
                httpClient.DefaultRequestHeaders.Add("Origin", "https://www.withclarity.com");
                httpClient.DefaultRequestHeaders.Referrer = new Uri("https://www.withclarity.com/");

                // Create the content
                var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");

                // Send the POST request
                var response = await httpClient.PostAsync(url, content);

                // Read the response (optional)
                var responseContent = await response.Content.ReadAsStringAsync();
                var root = JsonConvert.DeserializeObject<Root>(responseContent);
                await Console.Out.WriteLineAsync(root.data.liveDiamondData.diamond[0].diamond_name);
                foreach (Diamond diamond in root.data.liveDiamondData.diamond)
                {
                    await Console.Out.WriteLineAsync(diamond.diamond_name);
                }
            }
            return Ok("ahihi");
        }

        [HttpGet("/setting-variant")]
        public async Task<IActionResult> AddSettingAndVariant()
        {

            string url = "https://www.withclarity.com/collections/engagement-rings";
            var doc = await GetAndLoadHtml(url);
            var options = doc?.DocumentNode.SelectNodes("//*[@id=\"ProductSelect-setting-product-template\"]/option");

            if (options != null)
            {
                foreach (var node in options)
                {
                    string[] a = node.InnerText.Trim().Split(" / ");
                    string imageUrl = node.Attributes["data-variant-featured-img"].Value;
                    var price = Convert.ToDouble(node.Attributes["data-price-without-currency"].Value) / 100;
                    var material = a[0];
                    var shape = a[1];
                    new Variant
                    {
                        //Material = 
                    };
                }
            }
            else
            {
                await Console.Out.WriteLineAsync("No options found");
            }
            return Ok("ahihi");
        }

        [HttpGet("/shape")]
        public IActionResult AddShape()
        {
            foreach (string shape in this._shapes)
            {
                var shapeModel = new Shape
                {
                    Name = shape
                };
                _context.Shapes.Add(shapeModel);
            }
            _context.SaveChanges();
            return Ok("add ok");
        }

        [HttpGet("/material")]
        public IActionResult AddMaterial()
        {
            string[] materials = [
              "14KT White Gold",
              "14KT Yellow Gold",
              "14KT Rose Gold",
              "18KT White Gold",
              "18KT Yellow Gold",
              "18KT Rose Gold",
              "Platinum",
              "14KT White & Yellow Gold",
              "14KT White & Rose Gold",
              "18KT White & Yellow Gold",
              "18KT White & Rose Gold"
            ];
            foreach (string material in materials)
            {
                var materialModel = new Material
                {
                    Name = material
                };
                _context.Materials.Add(materialModel);
            }
            _context.SaveChanges();
            return Ok("add ok");
        }

        [HttpGet("/settingtype")]
        public IActionResult AddSettingType()
        {
            string[] settingTypes = [
              "Engagement Ring",
              "Earrings",
              "Necklaces",
              "Rings",
              "Bracelets",
            ];
            foreach (string settingType in settingTypes)
            {
                var settingTypeModel = new SettingType
                {
                    Name = settingType
                };
                _context.SettingTypes.Add(settingTypeModel);
            }
            _context.SaveChanges();
            return Ok("add ok");
        }
    }
}
