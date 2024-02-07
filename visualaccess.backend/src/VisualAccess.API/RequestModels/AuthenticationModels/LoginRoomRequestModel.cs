using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.AuthenticationModels
{
    public class LoginRoomRequestModel
    {
        [Required]
        public string? Name { get; set; }

        [Required]
        public string? Password { get; set; }
    }
}

