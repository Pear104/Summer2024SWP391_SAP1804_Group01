using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Blog;
using backend.Interfaces;
using backend.Mappers;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BlogsController : ControllerBase
    {
        private readonly IBlogRepository _blogRepo;

        public BlogsController(IBlogRepository blogRepo)
        {
            _blogRepo = blogRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetBlogs()
        {
            var blogModels = await _blogRepo.GetAllBlogsAsync();
            var blogDTOs = blogModels.Select(x => x.ToBlogDTO());
            return Ok(blogDTOs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetBlog(long id)
        {
            var blog = await _blogRepo.GetBlogByIdAsync(id);
            if (blog == null)
            {
                return NotFound();
            }

            return Ok(blog.ToBlogDTO());
        }

        [HttpPost]
        public async Task<IActionResult> PostBlog([FromBody] CreateBlogDTO blogDto)
        {
            var authorId = User.FindFirst("accountId")?.Value;
            var newBlog = await _blogRepo.CreateBlogAsync(long.Parse(authorId), blogDto);
            if (newBlog == null)
            {
                return BadRequest("You dont have permission to create blog.");
            }
            return Ok(newBlog);
        }

        [HttpPut]
        [Route("{id}")]
        public async Task<IActionResult> PutBlog(
            [FromRoute] long id,
            [FromBody] UpdateBlogDTO blogDto
        )
        {
            var account = await _blogRepo.UpdateBlogAsync(id, blogDto);
            if (account == null)
            {
                return NotFound("Account not found.");
            }
            return Ok(account);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBlog(long id)
        {
            var deletedBlog = await _blogRepo.DeleteBlogAsync(id);
            if (deletedBlog == null)
            {
                return BadRequest("You dont have permission to delete blog.");
            }
            return Ok(deletedBlog);
        }
    }
}