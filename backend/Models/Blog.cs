using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("blog")]
    public class Blog
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("blog_id")]
        public long BlogId { get; set; }

        [Column("author_id")]
        public long AuthorId { get; set; }
        public Account Author  { get; set; } = new Account();

        [Column("title")]
        public string Title { get; set; }

        [Column("content")]
        public string Content { get; set; }

        [Column(created_at)]
        public DateTime CreatedAt { get; set;}

    }
}
