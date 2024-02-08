using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.ManageAccountModels
{
    public class RemoveRequestModel
    {
        [Required]
        public string? Username { get; set; }
    }
}

