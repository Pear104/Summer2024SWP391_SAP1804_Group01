using BusinessObjects.Models;
using Helpers.DTOs.Blog;
using Helpers.Queries;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services.Implements
{
    public class BlogService : IBlogService
    {
        private readonly IBlogRepository _blogRepository;

        public BlogService(IBlogRepository blogRepository)
        {
            _blogRepository = blogRepository;
        }

        public Task<Blog?> CreateBlog(long authorId, CreateBlogDTO blogDto)
        {
            return _blogRepository.CreateBlogAsync(authorId, blogDto);
        }

        public Task<Blog?> DeleteBlog(long id, bool isHidden)
        {
            return _blogRepository.DeleteBlogAsync(id, isHidden);
        }

        public Task<BlogResult> GetAllBlogs(BlogQuery query)
        {
            return _blogRepository.GetAllBlogsAsync(query);
        }

        public Task<Blog?> GetBlogById(long id)
        {
            return _blogRepository.GetBlogByIdAsync(id);
        }

        public Task<Blog?> UpdateBlog(long id, UpdateBlogDTO blogDto)
        {
            return _blogRepository.UpdateBlogAsync(id, blogDto);
        }
    }
}
