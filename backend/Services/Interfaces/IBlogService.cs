using BusinessObjects.Models;
using Helpers.DTOs.Blog;
using Helpers.Queries;

namespace Services.Interfaces
{
    public interface IBlogService
    {
        Task<BlogResult> GetAllBlogs(BlogQuery query);
        Task<Blog?> GetBlogById(long id);
        Task<Blog?> CreateBlog(long authorId, CreateBlogDTO blogDto);
        Task<Blog?> UpdateBlog(long id, UpdateBlogDTO blogDto);
        Task<Blog?> DeleteBlog(long id, bool isHidden);
    }
}
