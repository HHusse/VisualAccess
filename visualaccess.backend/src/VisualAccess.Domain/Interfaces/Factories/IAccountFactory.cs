using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Factories
{
    public interface IAccountFactory
    {
        public Account Create(string firstName, string lastName, string username, string email, string password, string address, string phoneNumber, Role role, long createdAt);
    }
}

