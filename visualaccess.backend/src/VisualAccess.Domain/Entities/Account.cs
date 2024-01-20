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
            Username = username;
            Email = email;
            Password = password;
            Address = address;
            PhoneNumber = phoneNumber;
            Role = role;
            FaceID = null;
        }

        public Account(string firstName, string lastName, string username, string email, string password, string address, string phoneNumber, string roleAsString)
        {
            FirstName = firstName;
            LastName = lastName;
            Username = username;
            Email = email;
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
        }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public Role Role { get; set; }
        public int? FaceID { get; set; }
    }
}

