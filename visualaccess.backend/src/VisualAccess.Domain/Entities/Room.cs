using System;
namespace VisualAccess.Domain.Entities
{
    public class Room
    {
        public string Id { get; set; } = new("");
        public string Name { get; set; } = new("");
        public string Password { get; set; } = new("");
        public long CreatedAt { get; set; }
    }
}

