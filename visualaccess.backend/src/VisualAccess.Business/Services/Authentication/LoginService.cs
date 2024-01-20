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

namespace VisualAccess.Business.Services.Authentication
{
    public class LoginService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(LoginService).Name);
        private IAccountRepository repository;
        private IAccountValidator validator;
        private ITokenFactory factory;

        public LoginService(IAccountRepository repository, IAccountValidator validator, ITokenFactory factory)
        {
            this.repository = repository;
            this.validator = validator;
            this.factory = factory;
        }

        public async Task<Result> Execute(string username, string password)
        {
            DTOBase? dto = await repository.GetAccountByUsername(username);

            if (dto is null)
            {
                Result noAccountFoundResult = new(false, "No account found");
                log.Warn($"No account found for user {username}");
                return noAccountFoundResult;
            }

            Account account = Mappers.AccountMapper.MapToAccount((AccountDTO)dto);

            if (!validator.VerifyAccountPassword(account, password))
            {
                Result incorrectPasswordResult = new(false, "Incorrect password");
                log.Warn($"Incorrect password for user {account.Username}");
                return incorrectPasswordResult;
            }

            var token = factory.Create(account);
            log.Info($"Token was succesfuly created for user {username}");
            return new(true, token);
        }
    }
}

