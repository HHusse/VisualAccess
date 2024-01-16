using System;
using log4net;
using VisualAccess.DataAccess.Context;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;
using VisualAccess.Business.Validators;

namespace VisualAccess.Business.Services.Authentication
{
    public class RegisterService
    {
        private readonly VisualAccessDbContext dbContext;
        private readonly ILog log = LogManager.GetLogger(typeof(RegisterService).Name);
        private IAccountRepository repository;
        private IAccountValidator validator;

        public RegisterService(VisualAccessDbContext dbContext, IAccountRepository repository, IAccountValidator validator)
        {
            this.dbContext = dbContext;
            this.repository = repository;
            this.validator = validator;
        }

        public async Task<Result> Execute(Account account)
        {
            account.Password = BCrypt.Net.BCrypt.HashPassword(account.Password);
            if (!validator.IsValidUsername(account.Username))
            {
                log.Error($"The provided username is invalid");
                Result invalidUsernameResult = new(false, "Invalid username");
                return invalidUsernameResult;
            }

            if (!validator.IsValidEmail(account.Email))
            {
                log.Error($"The provided email is invalid");
                Result invalidEmailResult = new(false, "Invalid email");
                return invalidEmailResult;
            }

            if (!validator.IsValidPhoneNumber(account.PhoneNumber))
            {
                log.Error($"The provided phone number is invalid");
                Result invalidPhoneNumberResult = new(false, "Invalid phone number");
                return invalidPhoneNumberResult;
            }

            bool succed = await repository.CreateAccount(account);
            if (!succed)
            {
                log.Error("Something went wrong when trying to save in the database");
                return new(false, "Database Error");
            }

            log.Info($"The account with user {account.Username} was successfully registered");
            return new(true);
        }
    }
}

