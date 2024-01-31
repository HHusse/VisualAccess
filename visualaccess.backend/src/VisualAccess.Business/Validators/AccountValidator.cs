using System;
using System.Security.Principal;
using System.Text.RegularExpressions;
using log4net;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;

namespace VisualAccess.Business.Validators
{
    public class AccountValidator : IAccountValidator
    {
        private readonly IAccountRepository accountRepository;

        public AccountValidator(IAccountRepository accountRepository)
        {
            this.accountRepository = accountRepository;
        }

        public bool VerifyAccountPassword(Account account, string password)
        {
            return BCrypt.Net.BCrypt.Verify(password, account.Password);
        }

        public bool IsValidEmail(string email)
        {
            Regex emailRgx = new("^(?!.*[._]{2})[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$");
            return emailRgx.IsMatch(email);
        }

        public bool IsValidPhoneNumber(string phoneNumber)
        {
            Regex phoneNumberRgx = new("^[\\+]?[(]?[0-9]{3}[)]?[-\\s\\.]?[0-9]{3}[-\\s\\.]?[0-9]{4,6}$");
            return phoneNumberRgx.IsMatch(phoneNumber);
        }

        public bool IsValidUsername(string username)
        {
            Regex usernameRgx = new("^[a-zA-Z0-9_-]{5,15}$");
            return usernameRgx.IsMatch(username);
        }

        public async Task<bool> UsernameAlreadyExist(string username)
        {
            return await accountRepository.UsernameExist(username);
        }

        public async Task<bool> EmailAlreadyExist(string email)
        {
            return await accountRepository.EmailExist(email);
        }
    }
}

