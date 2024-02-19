using System;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Entities
{
    public class Account
    {
        public string? Id { get; set; }
        public string FirstName { get; set; } = new("");
        public string LastName { get; set; } = new("");
        public string Username { get; set; } = new("");
        public string Email { get; set; } = new("");
        public string Password { get; set; } = new("");
        public string Address { get; set; } = new("");
        public string PhoneNumber { get; set; } = new("");
        public Role Role { get; set; }
        public int? FaceID { get; set; }
        public List<string> AllowedRooms { get; set; } = new();
        public List<Notification> Notifications { get; set; } = new();
        public List<TemporaryRoomPermission> TemporaryRoomPermissions = new();
        public long CreatedAt { get; set; }
    }
}

