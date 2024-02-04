using System;
namespace VisualAccess.Domain.Entities
{
    public class Room
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public Room(string name)
        {
            Name = name.ToLower();
        }
    }
}

