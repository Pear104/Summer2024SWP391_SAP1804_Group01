using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Blog;
using backend.Models;

namespace backend.Mappers
{
    public static class BlogMapper
    {
        public static BlogDTO ToBlogDTO(this Blog blog)
        {
            return new BlogDTO
            {
                AuthorName = blog.Author.Name,
                BlogId = blog.BlogId,
                CreatedAt = blog.CreatedAt,
                Content = blog.Content,
                Title = blog.Title
            };
        }

        public static Blog ToBlogFromCreate(this CreateBlogDTO blogDto)
        {
            return new Blog() { Content = blogDto.Content, Title = blogDto.Title };
        }
    }
}
