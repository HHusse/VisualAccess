using System;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Mappers;

namespace VisualAccess.Business.Services.AccountServices
{
    public class RemoveService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RemoveService));
        private readonly IAccountRepository accountRepository;
        private readonly IFaceRepository faceRepository;

        public RemoveService(IAccountRepository accountRepository, IFaceRepository faceRepository)
        {
            this.accountRepository = accountRepository;
            this.faceRepository = faceRepository;
        }

        public async Task<ServiceResult> Execute(string username)
        {
            AccountDTO? accountDTO = (AccountDTO?)await accountRepository.GetAccountByUsername(username);
            if (accountDTO is null)
            {
                log.Warn($"Account with username {username.ToLower()} dosen't exist");
                return ServiceResult.ACCOUNT_NOT_FOUND;
            }

            Account account = Mapper<AccountDTO, Account>.Map(accountDTO);

            if (await accountRepository.RemoveAccount(accountDTO) == DatabaseResult.UNKNOWN_ERROR)
            {
                log.Error($"Somthing went wrong when trying to remove account with username: {username}");
                return ServiceResult.DATABASE_ERROR;
            }

            if (account.FaceID is not null && account.FaceID > 0)
            {
                FaceDTO? faceDTO = (FaceDTO?)await faceRepository.GetFace((int)account.FaceID);
                if (faceDTO is null)
                {
                    log.Error($"Something went wrong when trying to find face with id {(int)account.FaceID}");
                    return ServiceResult.DATABASE_ERROR;
                }

                DatabaseResult dbResult = await faceRepository.RemoveFace(faceDTO);
                if (dbResult == DatabaseResult.UNKNOWN_ERROR)
                {
                    log.Error($"Something went wrong when trying to remove face with id {(int)account.FaceID} associated with account {username}");
                    return ServiceResult.DATABASE_ERROR;
                }
            }

            return ServiceResult.OK;
        }
    }
}

