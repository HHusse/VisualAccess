﻿using System;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.ManageAccountServices
{
    public class GetAccountsByPageService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(GetAccountsByPageService));
        private readonly IAccountRepository accountRepository;
        private readonly IGenericMapper mapper;

        public GetAccountsByPageService(IAccountRepository accountRepository, IGenericMapper mapper)
        {
            this.accountRepository = accountRepository;
            this.mapper = mapper;
        }

        public async Task<(ServiceResult, List<Account>?, long pages)> Execute(int page)
        {
            List<AccountDto> accountsDTOList = (List<AccountDto>)await accountRepository.GetAccountsByPage(page);
            long accountCount = await accountRepository.GetAccountCount();
            double pagesDouble = (double)accountCount / 5;
            long pages = (long)Math.Ceiling(pagesDouble);

            if (accountsDTOList.Count == 0)
            {
                log.Warn($"No accounts found for page {page}");
                return new(ServiceResult.NOT_FOUND, null, 0);
            }

            log.Info($"Fetched {accountsDTOList.Count} accounts");
            List<Account> accountsList = mapper.Map<List<AccountDto>, List<Account>>(accountsDTOList);
            return new(ServiceResult.OK, accountsList, pages);

        }
    }
}

