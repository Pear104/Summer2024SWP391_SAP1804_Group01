using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using backend.DTOs.Blog;
using backend.Helper;
using backend.Interfaces;
using backend.Mappers;
using Microsoft.AspNetCore.Authorization;
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
        public async Task<ActionResult> GetBlogs([FromQuery] BlogQuery query)
        {
            var role = User.FindFirst(ClaimTypes.Role)?.Value;
            if (role == "Customer" || role == null)
            {
                query.IsHidden = false;
            }
            var blogResult = await _blogRepo.GetAllBlogsAsync(query);
            return Ok(blogResult);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetBlog(long id)
        {
            var blog = await _blogRepo.GetBlogByIdAsync(id);
            if (blog == null)
            {
                return NotFound();
            }

            return Ok(blog);
        }

        [HttpPost]
        public async Task<IActionResult> PostBlog([FromBody] CreateBlogDTO blogDto)
        {
            var authorId = User.FindFirst("accountId")?.Value;
            //dat fix null 25.06
            if (authorId == null)
            {
                return BadRequest("You dont have permission to create blog.");
            }
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
            var blog = await _blogRepo.UpdateBlogAsync(id, blogDto);
            if (blog == null)
            {
                return NotFound("Blog not found.");
            }
            return Ok(blog);
        }

        [HttpDelete("{id}/{isHidden}")]
        [Authorize(Roles = "Administrator")]
        public async Task<IActionResult> DeleteBlog([FromRoute] long id, [FromRoute] bool isHidden)
        {
            var deletedBlog = await _blogRepo.DeleteBlogAsync(id, isHidden);
            if (deletedBlog == null)
            {
                return BadRequest("You dont have permission to delete blog.");
            }
            return Ok(deletedBlog);
        }
    }
}
