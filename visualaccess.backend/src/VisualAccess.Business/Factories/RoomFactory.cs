using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Factories;

namespace VisualAccess.Business.Factories
{
    public class RoomFactory : IRoomFactory
    {
        public Room Create(string name, string password, long createdAt)
        {
            return new Room
            {
                Id = Guid.NewGuid().ToString(),
                Name = name.ToLower(),
                Password = BCrypt.Net.BCrypt.HashPassword(password),
                CreatedAt = createdAt
            };
        }
    }
}

