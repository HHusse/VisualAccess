using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.RoomModels
{
    public class RegisterRoomRequestModel
    {
        [Required]
        public string? Name { get; set; }
    }
}

