using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("setting")]
    public class Setting
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("setting_id")]
        public long Id { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;

        [Column("setting_style_id")]
        public long SettingStyleId { get; set; }
        public SettingStyle SettingStyle { get; set; }
        public List<Variant> Variants { get; set; } = new List<Variant>();
    }
}
