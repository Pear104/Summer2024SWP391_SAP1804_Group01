using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Blog;
using backend.Models;

namespace backend.Interfaces
{
    public interface IBlogRepository
    {
        Task<IEnumerable<Blog>> GetAllBlogsAsync();
        Task<Blog?> GetBlogByIdAsync(long id);
        Task<Blog?> CreateBlogAsync(long authorId, CreateBlogDTO blogDto);
        Task<Blog?> UpdateBlogAsync(long id, UpdateBlogDTO blogDto);
        Task<Blog?> DeleteBlogAsync(long id);
    }
}
