using System.ComponentModel.DataAnnotations;

namespace backend.DTOs.Account
{
    public class UpdatePasswordAccountDTO
    {
        [Required]
        public string CurPassword {get;set;} = string.Empty;
        [Required]
        public string Password {get;set;} = string.Empty;
    }
}
