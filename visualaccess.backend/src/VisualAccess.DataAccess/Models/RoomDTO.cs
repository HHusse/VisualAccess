using System;
using VisualAccess.Domain.Entities;

namespace VisualAccess.DataAccess.Models
{
    public class RoomDTO : DTOBase
    {
        public RoomDTO(string name)
        {
            Name = name;
        }

        public int Id { get; set; }
        public string Name { get; set; }
    }
}

