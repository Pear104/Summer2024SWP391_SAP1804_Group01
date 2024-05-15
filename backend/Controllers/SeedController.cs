using backend.Data;
using backend.Models;
using HtmlAgilityPack;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SeedController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        public SeedController(ApplicationDbContext context)
        {
            _context = context;
        }

        private async Task<HtmlDocument?> GetAndLoadHtml()
        {
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");

            try
            {
                string html = await client.GetStringAsync("https://www.withclarity.com/");
                await Console.Out.WriteLineAsync(html);
                var htmlDoc = new HtmlDocument();
                htmlDoc.LoadHtml(html);
                return htmlDoc;
            }
            catch (HttpRequestException ex)
            {
                Console.WriteLine($"Request error: {ex.Message}");
                return null;
            }
        }

        [HttpGet]
        public IActionResult AddShape()
        {

            return Ok("test");
        }

        [HttpGet]
        public IActionResult AddMaterial()
        {
            var shape = new Shape
            {
                Name = "Emerald"
            };
            _context.Shapes.Add(shape);
            _context.SaveChanges();
            return Ok("test");
        }
    }
}
