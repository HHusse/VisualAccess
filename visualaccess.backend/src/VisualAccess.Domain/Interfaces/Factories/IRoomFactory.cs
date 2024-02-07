using System;
using VisualAccess.Domain.Entities;

namespace VisualAccess.Domain.Interfaces.Factories
{
    public interface IRoomFactory
    {
        public Room Create(string name, string password, long createdAt);

    }
}

