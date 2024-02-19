using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Factories;

namespace VisualAccess.Business.Factories
{
    public class AccountFactory : IAccountFactory
    {
        public Account Create(string firstName, string lastName, string username, string email, string password, string address, string phoneNumber, Role role, long createdAt)
        {
            return new Account
            {
                Id = Guid.NewGuid().ToString(),
                FirstName = firstName,
                LastName = lastName,
                Username = username.ToLower(),
                Email = email.ToLower(),
                Password = BCrypt.Net.BCrypt.HashPassword(password),
                Address = address,
                PhoneNumber = phoneNumber,
                Role = role,
                CreatedAt = createdAt
            };
        }
    }
}

