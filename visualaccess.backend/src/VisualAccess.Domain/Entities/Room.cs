using System;
namespace VisualAccess.Domain.Entities
{
    public class Room
    {
        public string? Id { get; set; }
        public string Name { get; set; }
        public long CreatedAt { get; set; }

        public Room(string name)
        {
            Name = name.ToLower();
        }
    }
}

