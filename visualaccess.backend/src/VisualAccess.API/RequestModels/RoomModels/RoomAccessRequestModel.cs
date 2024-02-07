using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.RoomModels
{
    public class RoomAccessRequestModel
    {
        [Required]
        public IFormFile? FaceImg { get; set; }
    }
}

