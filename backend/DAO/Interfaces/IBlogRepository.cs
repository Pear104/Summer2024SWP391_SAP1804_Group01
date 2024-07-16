using backend.BusinessOjects.Models;
using backend.Services.DTOs.Blog;
using backend.Services.QueriesHelper;

namespace backend.Interfaces
{
    public interface IBlogRepository
    {
        Task<BlogResult> GetAllBlogsAsync(BlogQuery query);
        Task<Blog?> GetBlogByIdAsync(long id);
        Task<Blog?> CreateBlogAsync(long authorId, CreateBlogDTO blogDto);
        Task<Blog?> UpdateBlogAsync(long id, UpdateBlogDTO blogDto);
        Task<Blog?> DeleteBlogAsync(long id, bool isHidden);
    }
}
