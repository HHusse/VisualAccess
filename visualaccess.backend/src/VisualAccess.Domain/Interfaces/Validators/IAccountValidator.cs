﻿using System;
using VisualAccess.Domain.Entities;

namespace VisualAccess.Domain.Interfaces.Validators
{
    public interface IAccountValidator
    {
        public bool VerifyPassword(Account account, string password);
        public bool IsValidEmail(string email);
        public bool IsValidPhoneNumber(string phoneNumber);
        public bool IsValidUsername(string username);
        public Task<bool> UsernameAlreadyExist(string username);
        public Task<bool> EmailAlreadyExist(string email);
    }
}

