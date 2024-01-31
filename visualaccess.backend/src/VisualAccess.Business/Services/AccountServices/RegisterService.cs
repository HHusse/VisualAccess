using System;
using log4net;
using VisualAccess.DataAccess.Context;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;
using VisualAccess.Business.Validators;

namespace VisualAccess.Business.Services.AccountServices
{
    public class RegisterService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RegisterService));
        private readonly IAccountRepository repository;
        private readonly IAccountValidator validator;

        public RegisterService(IAccountRepository repository, IAccountValidator validator)
        {
            this.repository = repository;
            this.validator = validator;
        }

        /// <returns>
        /// The task result contains a Result object with the following status codes:
        /// 1 - Failure: Something went wrong when trying to create new account in database.
        /// 2 - Failure: Invalid username.
        /// 3 - Failure: Invalid email.
        /// 4 - Failure: Invalid phone number.
        /// 5 - Failure: Account with this username already exists
        /// 6 - Failure: Account with this email already exists
        /// </returns>
        public async Task<Result> Execute(Account account)
        {
            account.Password = BCrypt.Net.BCrypt.HashPassword(account.Password);
            if (!validator.IsValidUsername(account.Username))
            {
                log.Warn($"The provided username is invalid: {account.Username}");
                Result invalidUsernameResult = new(false, 2, "Invalid username");
                return invalidUsernameResult;
            }

            if (!validator.IsValidEmail(account.Email))
            {
                log.Warn($"The provided email is invalid: {account.Email}");
                Result invalidEmailResult = new(false, 3, "Invalid email");
                return invalidEmailResult;
            }

            if (!validator.IsValidPhoneNumber(account.PhoneNumber))
            {
                log.Warn($"The provided phone number is invalid: {account.PhoneNumber}");
                Result invalidPhoneNumberResult = new(false, 4, "Invalid phone number");
                return invalidPhoneNumberResult;
            }

            if (await validator.UsernameAlreadyExist(account.Username))
            {
                log.Warn($"An account with this username ({account.Username}) already exists");
                return new(false, 5, "Supplied username already exist");
            }

            if (await validator.EmailAlreadyExist(account.Email))
            {
                log.Warn($"An account with this email ({account.Email}) already exists");
                return new(false, 6, "The email provided is already associated with another account");
            }

            bool succed = await repository.CreateAccount(account);
            if (!succed)
            {
                log.Error("Something went wrong when trying to save in the database");
                return new(false, 1, "Database Error");
            }

            log.Info($"The account with user {account.Username} was successfully registered");
            return new(true);
        }
    }
}

