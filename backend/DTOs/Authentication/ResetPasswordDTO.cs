using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs.Authentication
{
    public class ResetPasswordDTO
    {
        [Required]
        public string Email { get; set; } = string.Empty;
    }
}
