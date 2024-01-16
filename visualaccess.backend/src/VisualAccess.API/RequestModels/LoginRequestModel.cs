﻿using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels
{
    public class LoginRequestModel
    {
        [Required]
        public string? Username { get; set; }

        [Required]
        public string? Password { get; set; }
    }
}

