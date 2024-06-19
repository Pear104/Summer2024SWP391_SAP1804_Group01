using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs.Blog;
using backend.Helper;
using backend.Interfaces;
using backend.Mappers;
using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Repository
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

        public async Task<Blog?> DeleteBlogAsync(long id)
        {
            var deletedModel = await _context
                .Blogs.Include(x => x.Author)
                .FirstOrDefaultAsync(x => x.BlogId == id);
            if (deletedModel != null)
            {
                _context.Blogs.Remove(deletedModel);
                await _context.SaveChangesAsync();
                return deletedModel;
            }
            return null;
        }

        public async Task<BlogResult> GetAllBlogsAsync(BlogQuery query)
        {
            var blogsQuery = _context.Blogs.Include(x => x.Author).AsQueryable();

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
