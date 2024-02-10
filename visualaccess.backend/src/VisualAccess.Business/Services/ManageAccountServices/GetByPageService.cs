using System;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.ManageAccountServices
{
    public class GetByPageService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(GetByPageService));
        private readonly IAccountRepository accountRepository;
        private readonly IGenericMapper mapper;

        public GetByPageService(IAccountRepository accountRepository, IGenericMapper mapper)
        {
            this.accountRepository = accountRepository;
            this.mapper = mapper;
        }

        public async Task<(ServiceResult, List<Account>?)> Execute(int page)
        {
            List<AccountDTO> accountsDTOList = (List<AccountDTO>)await accountRepository.GetAccountsByPage(page);
            if (accountsDTOList.Count() == 0)
            {
                log.Warn($"No accounts found for page {page}");
                return new(ServiceResult.NOT_FOUND, null);
            }

            log.Info($"Fetched {accountsDTOList.Count()} accounts");
            List<Account> accountsList = mapper.Map<List<AccountDTO>, List<Account>>(accountsDTOList);
            return new(ServiceResult.OK, accountsList);

        }
    }
}

