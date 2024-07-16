using BusinessObjects.Enums;
using System.ComponentModel.DataAnnotations;

namespace Helpers.DTOs.Authentication
{
    public class RegisterDTO
    {
        [Required]
        //dat fix null 25.06
        public string Name { get; set; } = "";

        [Required]
        public string PhoneNumber { get; set; } = "";

        [Required]
        public string Address { get; set; } = "";

        [Required]
        public string Email { get; set; } = "";

        [Required]
        public string Password { get; set; } = "";

        [Required]
        public DateTime Birthday { get; set; }

        [Required]
        [EnumDataType(typeof(Gender))]
        public Gender Gender { get; set; } = Gender.Other;
    }
}
