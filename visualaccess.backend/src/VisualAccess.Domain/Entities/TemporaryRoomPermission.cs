using System;
namespace VisualAccess.Domain.Entities
{
    public class TemporaryRoomPermission
    {
        public string Room { get; set; } = new("");
        public long From { get; set; }
        public long Until { get; set; }
    }
}

