using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.RequestRoomPermissionModels
{
    public class CreateRequestRoomPermissionRequestModel
    {
        [Required]
        public string? RoomName { get; set; }

        [Required]
        [ValidRequestRoomPermission]
        public string? Type { get; set; }

        public string? Message { get; set; }
    }
}

