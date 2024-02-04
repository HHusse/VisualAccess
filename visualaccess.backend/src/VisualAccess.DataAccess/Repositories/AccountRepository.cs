using System;
using System.Security.Principal;
using log4net;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Context;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Exceptions;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Mappers;

namespace VisualAccess.DataAccess.Repositories
{
    public class AccountRepository : IAccountRepository
    {
        private readonly VisualAccessDbContext dbContext;
        private readonly ILog log = LogManager.GetLogger("Database");

        public AccountRepository(VisualAccessDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<DatabaseResult> CreateAccount(Account account)
        {
            AccountDTO newAccount = Mapper<Account, AccountDTO>.Map(account);
            try
            {
                await dbContext.Accounts.AddAsync(newAccount);
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly added new account {account.Username} in database");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DTOBase?> GetAccountByUsername(string username)
        {
            AccountDTO? searchedAccount = await dbContext.Accounts.FirstOrDefaultAsync(a => a.Username == username.ToLower());

            if (searchedAccount is not null)
            {
                log.Info($"Account with username {username.ToLower()} was found in database");
            }
            else
            {
                log.Warn($"Account with username {username.ToLower()} was not found in database");
            }

            return searchedAccount;
        }

        public async Task<DatabaseResult> AssociateFaceID(DTOBase accountDTO, int faceID)
        {
            if (accountDTO is not AccountDTO accountDTOCasted)
            {
                log.Error($"Invalid operation: Provided DTOBase is not an AccountDTO.");
                return DatabaseResult.INVALID_OPERATION;
            }

            accountDTOCasted.FaceID = faceID;
            try
            {
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly associate FaceID with account {accountDTOCasted.Username}");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<bool> UsernameExist(string username)
        {
            var account = await dbContext.Accounts.FirstOrDefaultAsync(a => a.Username == username.ToLower());
            return account != null ? true : false;
        }

        public async Task<bool> EmailExist(string email)
        {
            var account = await dbContext.Accounts.FirstOrDefaultAsync(a => a.Email == email);
            return account != null ? true : false;
        }

        public async Task<DatabaseResult> RemoveAccount(DTOBase accountDTO)
        {
            if (accountDTO is not AccountDTO accountDTOCasted)
            {
                log.Error($"Invalid operation: Provided DTOBase is not an AccountDTO.");
                return DatabaseResult.INVALID_OPERATION;
            }

            try
            {
                dbContext.Accounts.Remove(accountDTOCasted);
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly removed the account with username {accountDTOCasted.Username} from database");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }
    }
}

