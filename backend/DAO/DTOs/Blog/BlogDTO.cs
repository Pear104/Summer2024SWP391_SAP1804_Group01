using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Services.DTOs.Blog
{
    public class BlogDTO
    {
        public long BlogId { get; set; }
        public string? AuthorName { get; set; }
        public string? ThumbnailUrl { get; set; }
        public string? Title { get; set; }
        public string? Content { get; set; }
        public Boolean? IsHidden { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
