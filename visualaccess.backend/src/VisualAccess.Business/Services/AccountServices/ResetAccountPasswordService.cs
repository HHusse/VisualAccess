﻿using System;
using log4net;
using VisualAccess.Business.Services.ManageAccountServices;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;

namespace VisualAccess.Business.Services.AccountServices
{
    public class ResetAccountPasswordService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(ResetAccountPasswordService));
        private Account account;
        private readonly IAccountRepository accountRepository;
        private readonly IAccountValidator accountValidator;
        private readonly IGenericMapper mapper;

        public ResetAccountPasswordService(Account account, IAccountRepository accountRepository, IAccountValidator accountValidator, IGenericMapper mapper)
        {
            this.account = account;
            this.accountRepository = accountRepository;
            this.accountValidator = accountValidator;
            this.mapper = mapper;
        }

        public async Task<ServiceResult> Execute(string oldPassword, string newParssword, string confirmedPassword)
        {
            if (newParssword != confirmedPassword)
            {
                return ServiceResult.INVALID_OPERATION;
            }
            if (newParssword == oldPassword)
            {
                return ServiceResult.SAME_PASSWORD;
            }
            if (!accountValidator.VerifyPassword(account, oldPassword))
            {
                return ServiceResult.WRONG_PASSWORD;
            }

            account.Password = BCrypt.Net.BCrypt.HashPassword(newParssword);

            switch (await accountRepository.UpdateAccount(account))
            {
                case DatabaseResult.ACCOUNT_NOT_FOUND:
                    return ServiceResult.ACCOUNT_NOT_FOUND;
                case DatabaseResult.UNKNOWN_ERROR:
                    return ServiceResult.DATABASE_ERROR;
            }

            return ServiceResult.OK;
        }
    }
}
