using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("setting_style")]

    public class SettingStyle
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("setting_style_id")]
        public long Id { get; set; }

        [Column("name")]
        public string Name { get; set; } = string.Empty;


        [Column("setting_type_id")]
        public long SettingTypeId { get; set; }
        public SettingType SettingType { get; set; }
        public List<Setting> Settings { get; set; } = new List<Setting>();
    }
}
