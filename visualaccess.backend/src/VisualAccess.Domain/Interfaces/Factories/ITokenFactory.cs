using System;
using VisualAccess.Domain.Entities;

namespace VisualAccess.Domain.Interfaces.Factories
{
    public interface ITokenFactory
    {
        public string Create(Account account);
        public string Create(Room room);
    }
}

