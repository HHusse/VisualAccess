using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Validators;

namespace VisualAccess.Business.Validators
{
    public class RoomValidator : IRoomValidator
    {
        public bool VerifyAccountPassword(Room room, string password)
        {
            return BCrypt.Net.BCrypt.Verify(password, room.Password);
        }
    }
}

