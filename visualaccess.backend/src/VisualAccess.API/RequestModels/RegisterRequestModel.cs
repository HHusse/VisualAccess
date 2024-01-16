using System;
using System.ComponentModel.DataAnnotations;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.API.RequestModels
{
    public class RegisterRequestModel
    {
        [Required]
        public string? FirstName { get; set; }

        [Required]
        public string? LastName { get; set; }

        [Required]
        public string? Username { get; set; }

        [Required]
        [EmailAddress]
        public string? Email { get; set; }

        [Required]
        public string? Password { get; set; }

        [Required]
        public string? Address { get; set; }

        [Required]
        [Phone]
        public string? PhoneNumber { get; set; }

        [Required]
        [ValidRole]
        public string? Role { get; set; }
    }
}

