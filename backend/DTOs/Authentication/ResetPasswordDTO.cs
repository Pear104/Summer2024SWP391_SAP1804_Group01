using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs.Authentication
{
    public class ResetPasswordDTO
    {
        public string Email { get; set; } = string.Empty;
    }
}
