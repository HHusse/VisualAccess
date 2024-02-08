using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.ManageRoomModels
{
    public class RemoveRoomRequestModel
    {
        [Required]
        public string? Name { get; set; }
    }
}

