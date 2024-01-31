using System;
using log4net;
using VisualAccess.DataAccess.Context;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Factories;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;
using VisualAccess.Business.Factories;
using VisualAccess.Business.Validators;

namespace VisualAccess.Business.Services.AuthenticationServices
{
    public class LoginService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(LoginService));
        private readonly IAccountRepository repository;
        private readonly IAccountValidator validator;
        private readonly ITokenFactory factory;

        public LoginService(IAccountRepository repository, IAccountValidator validator, ITokenFactory factory)
        {
            this.repository = repository;
            this.validator = validator;
            this.factory = factory;
        }

        /// <returns>
        /// The task result contains a Result object with the following status codes:
        /// 1 - Failure: The account with the specified username was not found in the database.
        /// 2 - Failure: Incorrect password for specified username.
        /// </returns>
        public async Task<Result> Execute(string username, string password)
        {
            DTOBase? dto = await repository.GetAccountByUsername(username);

            if (dto is null)
            {
                Result noAccountFoundResult = new(false, 1, "No account found");
                log.Warn($"No account found for user {username}");
                return noAccountFoundResult;
            }

            Account account = Mappers.AccountMapper.MapToAccount((AccountDTO)dto);

            if (!validator.VerifyAccountPassword(account, password))
            {
                Result incorrectPasswordResult = new(false, 2, "Incorrect password");
                log.Warn($"Incorrect password for user {account.Username}");
                return incorrectPasswordResult;
            }

            var token = factory.Create(account);
            log.Info($"Token was succesfuly created for user {username}");
            return new(true, token);
        }
    }
}

