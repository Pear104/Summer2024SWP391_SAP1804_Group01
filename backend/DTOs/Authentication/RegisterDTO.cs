﻿using System.ComponentModel.DataAnnotations;
using backend.Enums;

namespace backend.DTOs.Authentication
{
    public class RegisterDTO
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string PhoneNumber { get; set; }

        [Required]
        public string Address { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        public string Password { get; set; }

        [Required]
        public DateTime Birthday { get; set; }

        [Required]
        [EnumDataType(typeof(Gender))]
        public Gender Gender { get; set; } = Gender.Other;
    }
}