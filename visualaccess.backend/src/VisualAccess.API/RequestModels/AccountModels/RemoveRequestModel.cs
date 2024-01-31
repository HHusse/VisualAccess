using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.AccountModels
{
    public class RemoveRequestModel
    {
        [Required]
        public string? Username { get; set; }
    }
}

