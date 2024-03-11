using System;
using System.Security.Principal;
using System.Text.RegularExpressions;
using log4net;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;
using System.Threading.Tasks;

namespace VisualAccess.Business.Validators
{
    public partial class AccountValidator : IAccountValidator
    {
        private readonly IAccountRepository accountRepository;

        public AccountValidator(IAccountRepository accountRepository)
        {
            this.accountRepository = accountRepository;
        }

        public bool VerifyPassword(Account account, string password)
        {
            return BCrypt.Net.BCrypt.Verify(password, account.Password);
        }

        [GeneratedRegex("^(?!.*[._]{2})[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")]
        private static partial Regex EmailRegex();

        public bool IsValidEmail(string email)
        {
            return EmailRegex().IsMatch(email);
        }

        [GeneratedRegex("^[\\+]?[(]?[0-9]{3}[)]?[-\\s\\.]?[0-9]{3}[-\\s\\.]?[0-9]{4,6}$")]
        private static partial Regex PhoneNumberRegex();

        public bool IsValidPhoneNumber(string phoneNumber)
        {
            return PhoneNumberRegex().IsMatch(phoneNumber);
        }

        [GeneratedRegex("^[a-zA-Z0-9_-]{5,15}$")]
        private static partial Regex UsernameRegex();

        public bool IsValidUsername(string username)
        {
            return UsernameRegex().IsMatch(username);
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
