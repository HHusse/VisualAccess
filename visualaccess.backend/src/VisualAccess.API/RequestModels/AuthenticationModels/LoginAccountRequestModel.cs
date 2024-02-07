using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.AuthenticationModels
{
    public class LoginAccountRequestModel
    {
        [Required]
        public string? Username { get; set; }

        [Required]
        public string? Password { get; set; }
    }
}

