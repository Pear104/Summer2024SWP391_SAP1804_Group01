﻿using System.ComponentModel.DataAnnotations;

namespace backend.Services.DTOs.Authentication
{
    public class LoginDTO
    {
        [Required]
        public string Email { get; set; } = string.Empty;

        [Required]
        public string Password { get; set; } = string.Empty;
    }
}