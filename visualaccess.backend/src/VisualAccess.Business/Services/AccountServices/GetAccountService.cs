using System;
using log4net;
using VisualAccess.Business.Services.ManageAccountServices;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;
using ZstdSharp.Unsafe;

namespace VisualAccess.Business.Services.AccountServices
{
    public class GetAccountService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(AddRoomPremissionService));
        private readonly IAccountRepository accountRepository;
        private readonly IGenericMapper mapper;

        public GetAccountService(IAccountRepository accountRepository, IGenericMapper mapper)
        {
            this.accountRepository = accountRepository;
            this.mapper = mapper;
        }

        public async Task<(ServiceResult, Account?)> Execute(string username)
        {
            AccountDTO? accountDTO = (AccountDTO?)await accountRepository.GetAccount(username);
            if (accountDTO is null)
            {
                log.Warn($"Account with username {username.ToLower()} dosen't exist");
                return new(ServiceResult.ACCOUNT_NOT_FOUND, null);
            }

            Account account = mapper.Map<AccountDTO, Account>(accountDTO);

            account.TemporaryRoomPermissions.RemoveAll(temp => temp.Until < DateTimeOffset.Now.ToUnixTimeSeconds());
            _ = accountRepository.UpdateAccount(account);
            return new(ServiceResult.OK, account);
        }
    }
}

