﻿using System;
using log4net;
using VisualAccess.DataAccess.Contexts;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Factories;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;
using VisualAccess.Business.Factories;
using VisualAccess.Business.Validators;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;

namespace VisualAccess.Business.Services.AuthenticationServices
{
    public class LoginAccountService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(LoginAccountService));
        private readonly IAccountRepository repository;
        private readonly IAccountValidator validator;
        private readonly ITokenFactory factory;
        private readonly IGenericMapper mapper;

        public LoginAccountService(IAccountRepository repository, IAccountValidator validator, ITokenFactory factory, IGenericMapper mapper)
        {
            this.repository = repository;
            this.validator = validator;
            this.factory = factory;
            this.mapper = mapper;
        }

        public async Task<(ServiceResult, string)> Execute(string username, string password)
        {
            AccountDto? accountDTO = (AccountDto?)await repository.GetAccount(username);

            if (accountDTO is null)
            {
                log.Warn($"No account found for user {username}");
                return new(ServiceResult.ACCOUNT_NOT_FOUND, "");
            }

            Account account = mapper.Map<AccountDto, Account>(accountDTO);

            if (!validator.VerifyPassword(account, password))
            {
                log.Warn($"Incorrect password for user {account.Username}");
                return new(ServiceResult.WRONG_PASSWORD, "");
            }

            var token = factory.Create(account);
            log.Info($"Token was succesfuly created for user {account.Username}");
            return new(ServiceResult.OK, token);
        }
    }
}

