using System;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.ServicesClient;
using ZstdSharp.Unsafe;

namespace VisualAccess.Business.Services.ManageAccountServices
{
    public class RemoveAccountService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RemoveAccountService));
        private readonly IAccountRepository accountRepository;
        private readonly IFaceRepository faceRepository;
        private readonly IGenericMapper mapper;
        private readonly IFaceRecognitionServiceClient client;

        public RemoveAccountService(IAccountRepository accountRepository, IFaceRepository faceRepository, IGenericMapper mapper, IFaceRecognitionServiceClient client)
        {
            this.accountRepository = accountRepository;
            this.faceRepository = faceRepository;
            this.mapper = mapper;
            this.client = client;
        }

        public async Task<ServiceResult> Execute(Account currentAccount, string username)
        {
            AccountDTO? accountDTO = (AccountDTO?)await accountRepository.GetAccount(username);
            if (accountDTO is null)
            {
                log.Warn($"Account with username {username.ToLower()} dosen't exist");
                return ServiceResult.ACCOUNT_NOT_FOUND;
            }


            Account account = mapper.Map<AccountDTO, Account>(accountDTO);
            if (currentAccount.Role != Role.ADMIN && account.Role == Role.ADMIN)
            {
                log.Warn($"Account with role {currentAccount.Role} try to remove an ADMIN account");
                return ServiceResult.INVALID_OPERATION;
            }

            if (currentAccount.Username == username)
            {
                log.Warn($"Account with username {username} try to remove his own account");
                return ServiceResult.INVALID_OPERATION;
            }

            if (await accountRepository.RemoveAccount(account) == DatabaseResult.UNKNOWN_ERROR)
            {
                log.Error($"Somthing went wrong when trying to remove account with username: {username}");
                return ServiceResult.DATABASE_ERROR;
            }

            if (account.FaceID is not null && account.FaceID > 0)
            {
                DatabaseResult dbResult = await faceRepository.RemoveFace((int)account.FaceID);
                if (dbResult == DatabaseResult.UNKNOWN_ERROR)
                {
                    log.Error($"Something went wrong when trying to remove face with id {(int)account.FaceID} associated with account {username}");
                    return ServiceResult.DATABASE_ERROR;
                }
                _ = client.RefreshCache();
            }

            return ServiceResult.OK;
        }
    }
}

