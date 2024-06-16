using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using backend.DTOs.Blog;
using backend.Helper;
using backend.Models;

namespace backend.Mappers
{
    public static class BlogMapper
    {
        public static BlogDTO ToBlogDTO(this Blog blog)
        {
            string cleanedContent = Regex.Replace(blog.Content, "<.*?>", string.Empty);

            return new BlogDTO
            {
                AuthorName = blog.Author.Name,
                BlogId = blog.BlogId,
                CreatedAt = blog.CreatedAt,
                Content =
                    cleanedContent.Length > 200 ? cleanedContent.Substring(0, 200) : cleanedContent,
                ThumbnailUrl = HtmlParser.ExtractFirstImageFromHtml(blog.Content),
                Title = blog.Title
            };
        }

        public static Blog ToBlogFromCreate(this CreateBlogDTO blogDto)
        {
            return new Blog() { Content = blogDto.Content, Title = blogDto.Title };
        }
    }
}
