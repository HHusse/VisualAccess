using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.AccountModels
{
    public class ResetPasswordRequestModel
    {
        [Required]
        public string? OldPassword { get; set; }

        [Required]
        public string? NewPassword { get; set; }

        [Required]
        public string? ConfirmedPassword { get; set; }

    }
}

