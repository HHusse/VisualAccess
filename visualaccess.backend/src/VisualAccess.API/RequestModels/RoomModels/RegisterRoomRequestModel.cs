﻿using System;
using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.RoomModels
{
    public class RegisterRoomRequestModel
    {
        [Required]
        public string? Name { get; set; }

        [Required]
        public string? Password { get; set; }
    }
}

