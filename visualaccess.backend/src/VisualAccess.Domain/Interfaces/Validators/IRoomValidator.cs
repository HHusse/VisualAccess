using System;
using VisualAccess.Domain.Entities;

namespace VisualAccess.Domain.Interfaces.Validators
{
    public interface IRoomValidator
    {
        public bool VerifyPassword(Room room, string password);
    }
}

