using System;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Entities
{
    public class Account
    {
        public Account(string firstName, string lastName, string username, string email, string password, string address, string phoneNumber, Role role)
        {
            FirstName = firstName;
            LastName = lastName;
            Username = username.ToLower();
            Email = email.ToLower();
            Password = password;
            Address = address;
            PhoneNumber = phoneNumber;
            Role = role;
            FaceID = null;
            AllowedRooms = new();
        }

        public Account(string firstName, string lastName, string username, string email, string password, string address, string phoneNumber, string roleAsString)
        {
            FirstName = firstName;
            LastName = lastName;
            Username = username.ToLower();
            Email = email.ToLower();
            Password = password;
            Address = address;
            PhoneNumber = phoneNumber;

            if (Enum.TryParse<Role>(roleAsString, out var role))
            {
                Role = role;
            }
            else
            {
                throw new ArgumentException($"Invalid role value: {roleAsString}");
            }

            FaceID = null;
            AllowedRooms = new();
        }

        public string? Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public Role Role { get; set; }
        public int? FaceID { get; set; }
        public List<string> AllowedRooms { get; set; }
        public long CreatedAt { get; set; }
    }
}

