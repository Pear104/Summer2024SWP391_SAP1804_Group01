using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("setting_type")]
    public class SettingType
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("setting_type_id")]
        public long Id { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;
        public List<SettingStyle> SettingStyles { get; set; } = new List<SettingStyle>();
    }
}
