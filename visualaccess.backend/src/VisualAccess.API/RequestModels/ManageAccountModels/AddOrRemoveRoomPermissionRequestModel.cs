using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.ManageAccountModels
{
    public class AddOrRemoveRoomPermissionRequestModel
    {
        [Required]
        public string? Username { get; set; }
        [Required]
        public string? RoomName { get; set; }
    }
}

