using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.ManageAccountModels
{
    public class GetAccountRequestModel
    {
        [Required]
        public string? Username { get; set; }
    }
}

