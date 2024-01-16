using System;
using AutoMapper;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;

namespace VisualAccess.Business.Mappers
{
    public static class AccountMapper
    {
        public static Account MapToAccount(AccountDTO dto)
        {
            var configMapper = new MapperConfiguration(cfg => cfg.CreateMap<AccountDTO, Account>());

            var mapper = configMapper.CreateMapper();
            return mapper.Map<Account>(dto);
        }

        public static AccountDTO MapToAccountDTO(Account account)
        {
            var configMapper = new MapperConfiguration(cfg => cfg.CreateMap<Account, AccountDTO>());

            var mapper = configMapper.CreateMapper();
            return mapper.Map<AccountDTO>(account);
        }
    }
}

