using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.ManageAccountModels
{
    public class RegisterFaceRequestModel
    {
        [Required]
        public string? Username { get; set; }

        [Required]
        public IFormFile? FaceImg { get; set; }
    }
}

