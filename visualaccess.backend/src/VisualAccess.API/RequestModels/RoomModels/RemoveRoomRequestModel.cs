using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.RoomModels
{
    public class RemoveRoomRequestModel
    {
        [Required]
        public string? Name { get; set; }
    }
}

