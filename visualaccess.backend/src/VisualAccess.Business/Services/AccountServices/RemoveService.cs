using System;
using log4net;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;

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

        /// <returns>
        /// The task result contains a Result object with the following status codes:
        /// 1 - Failure: There is no account with provided username
        /// 2 - Failure: Somthing went wrong when trying to remove account
        /// 3 - Failure: Something went wrong when trying to remove face associated with this account
        /// </returns>
        public async Task<Result> Execute(string username)
        {
            if (!await accountRepository.UsernameExist(username))
            {
                log.Warn($"There is no account with username {username}");
                return new(false, 1, "There is no account with provided username");
            }

            int faceId = await accountRepository.GetFaceId(username);

            if (!await accountRepository.RemoveAccount(username))
            {
                log.Error($"Somthing went wrong when trying to remove account with username: {username}");
                return new(false, 2, $"Somthing went wrong when trying to remove account");
            }

            if (faceId > 0 && !await faceRepository.RemoveFace(faceId))
            {
                log.Error($"Something went wrong when trying to remove face with id {faceId} associated with account {username}");
                return new(false, 3, "Something went wrong when trying to remove face associated with this account");
            }

            return new(true);
        }
    }
}

