using System.ComponentModel.DataAnnotations;

namespace Helpers.DTOs.Account
{
    public class UpdateAccountDTO
    {
        [Required]
        public string Name { get; set; } = string.Empty;

        [Required]
        public string PhoneNumber { get; set; } = string.Empty;

        [Required]
        public string Address { get; set; } = string.Empty;

        [Required]
        public DateTime Birthday { get; set; }

        [Required]
        public string Gender { get; set; } = string.Empty;
    }
}
