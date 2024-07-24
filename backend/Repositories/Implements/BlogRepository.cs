using BusinessObjects.Models;
using DAOs;
using Helpers.DTOs.Blog;
using Helpers.Mappers;
using Helpers.Queries;
using Microsoft.EntityFrameworkCore;
using Repositories.Interfaces;

namespace Repositories.Implements
{
    public class BlogRepository : IBlogRepository
    {
        private readonly ApplicationDbContext _context;

        public BlogRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Blog?> CreateBlogAsync(long authorId, CreateBlogDTO blogDto)
        {
            var author = await _context.Accounts.FindAsync(authorId);
            if (author == null)
            {
                return null;
            }
            var blog = blogDto.ToBlogFromCreate();
            blog.Author = author;

            await _context.Blogs.AddAsync(blog);
            await _context.SaveChangesAsync();
            return blog;
        }

        public async Task<Blog?> DeleteBlogAsync(long id, bool isHidden)
        {
            var blog = await _context
                .Blogs.Include(x => x.Author)
                .FirstOrDefaultAsync(x => x.BlogId == id);
            if (blog != null)
            {
                blog.IsHidden = isHidden;
                _context.Entry(blog).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return blog;
            }
            return null;
        }

        public async Task<BlogResult> GetAllBlogsAsync(BlogQuery query)
        {
            var blogsQuery = _context.Blogs.Include(x => x.Author).AsQueryable();

            if (!string.IsNullOrEmpty(query.SortBy))
            {
                blogsQuery = blogsQuery.OrderByDescending(x => x.CreatedAt);
            }

            if (query.Type == "promotion")
            {
                blogsQuery = blogsQuery.Where(x => x.Title.Contains("[PROMOTION]"));
            }
            else if (query.Type == "knowledge")
            {
                blogsQuery = blogsQuery.Where(x => !x.Title.Contains("[PROMOTION]"));
            }

            if (query.IsHidden != null)
            {
                blogsQuery = blogsQuery.Where(x => x.IsHidden == query.IsHidden);
            }

            if (query.Title != null)
            {
                blogsQuery = blogsQuery.Where(x =>
                    x.Title.ToLower().Contains(query.Title.ToLower())
                );
            }

            var totalCount = await blogsQuery.CountAsync();
            var totalPages = totalCount / (query.PageSize ?? 10);
            var blogs = await blogsQuery
                .Skip(((query.PageNumber ?? 1) - 1) * (query.PageSize ?? 10))
                .Take(query.PageSize ?? 10)
                .Select(x => x.ToBlogDTO())
                .ToListAsync();

            return new BlogResult
            {
                Blogs = blogs,
                TotalPages = totalPages,
                TotalCount = totalCount,
                PageSize = query.PageSize ?? 10,
                CurrentPage = query.PageNumber ?? 1
            };
        }

        public async Task<Blog?> GetBlogByIdAsync(long id)
        {
            return await _context
                .Blogs.Include(x => x.Author)
                .FirstOrDefaultAsync(x => x.BlogId == id);
        }

        public async Task<Blog?> UpdateBlogAsync(long id, UpdateBlogDTO blogDto)
        {
            var existingBlog = await _context.Blogs.FindAsync(id);
            if (existingBlog == null)
            {
                return null;
            }

            existingBlog.Title = blogDto.Title;
            existingBlog.Content = blogDto.Content;

            _context.Entry(existingBlog).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existingBlog;
        }
    }
}
