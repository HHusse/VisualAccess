using System;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Entities
{
    public class RequestRoomPermission
    {
        public string? Id { get; set; }
        public RequestRoomPermissionType Type { get; set; }
        public string Username { get; set; } = new("");
        public string RoomName { get; set; } = new("");
        public string? RequestMessage { get; set; }
    }
}

