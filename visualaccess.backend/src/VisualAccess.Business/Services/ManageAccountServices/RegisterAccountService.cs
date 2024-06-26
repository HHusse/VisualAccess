﻿using System;
using log4net;
using VisualAccess.DataAccess.Contexts;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;
using VisualAccess.Business.Validators;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Utils;

namespace VisualAccess.Business.Services.ManageAccountServices
{
    public class RegisterAccountService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RegisterAccountService));
        private readonly IAccountRepository repository;
        private readonly IAccountValidator validator;

        public RegisterAccountService(IAccountRepository repository, IAccountValidator validator)
        {
            this.repository = repository;
            this.validator = validator;
        }

        public async Task<ServiceResult> Execute(Account currentAccount, Account account, string generatedPassword)
        {
            if (currentAccount.Role != Role.ADMIN && account.Role == Role.ADMIN)
            {
                log.Warn($"Account with role {currentAccount.Role} try to register an ADMIN account");
                return ServiceResult.INVALID_OPERATION;
            }

            if (!validator.IsValidUsername(account.Username))
            {
                log.Warn($"The provided username is invalid: {account.Username}");
                return ServiceResult.INVALID_USERNAME;
            }

            if (!validator.IsValidEmail(account.Email))
            {
                log.Warn($"The provided email is invalid: {account.Email}");
                return ServiceResult.INVALID_EMAIL;
            }

            if (!validator.IsValidPhoneNumber(account.PhoneNumber))
            {
                log.Warn($"The provided phone number is invalid: {account.PhoneNumber}");
                return ServiceResult.INVALID_PHONE_NUMBER;
            }

            if (await validator.UsernameAlreadyExist(account.Username))
            {
                log.Warn($"An account with this username ({account.Username}) already exists");
                return ServiceResult.ACCOUNT_ALREADY_EXIST;
            }

            if (await validator.EmailAlreadyExist(account.Email))
            {
                log.Warn($"An account with this email ({account.Email}) already exists");
                return ServiceResult.EMAIL_ALREADY_EXIST;
            }

            DatabaseResult result = await repository.CreateAccount(account);
            if (result == DatabaseResult.UNKNOWN_ERROR)
            {
                log.Error("Something went wrong when trying to save in the database");
                return ServiceResult.DATABASE_ERROR;
            }
            try
            {
                if (!MailSender.WelcomeMessage(account.Email, account.Username, generatedPassword))
                {
                    log.Warn($"Because the email for account {account.Username} [Email address: {account.Email}] could not be sent, it will be deleted");
                    _ = repository.RemoveAccount(account);
                    return ServiceResult.FAIL_TO_SEND_EMAIL;
                }
            }
            catch (Exception e)
            {
                log.Error($"Something went wrong trying to send email to {account.Email}: {e.Message}");
                log.Warn($"Because the email for account {account.Username} [Email address: {account.Email}] could not be sent, it will be deleted");
                _ = repository.RemoveAccount(account);
                return ServiceResult.FAIL_TO_SEND_EMAIL;
            }
            log.Info($"The account with user {account.Username} was successfully registered");
            return ServiceResult.OK;
        }
    }
}

