using System;
using log4net;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Context;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Exceptions;
using VisualAccess.Domain.Interfaces.Repositories;

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

        public async Task<bool> CreateAccount(Account account)
        {
            AccountDTO newAccount = new(account.FirstName, account.LastName, account.Username, account.Email, account.Password, account.Address, account.PhoneNumber, account.Role);
            try
            {
                await dbContext.AddAsync(newAccount);
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly added new account {account.Username} in database");
                return true;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return false;
            }
        }

        public async Task<DTOBase?> GetAccountByUsername(string username)
        {
            var account = await dbContext.Accounts.FirstOrDefaultAsync(a => a.Username == username);

            if (account is not null)
            {
                log.Info($"Account with user {username} was found in database");
            }
            else
            {
                log.Warn($"Account with user {username} was not found in database");
            }

            return account;
        }

        public async Task<bool> AssociateFaceID(string username, int faceID)
        {
            var account = await dbContext.Accounts.FirstOrDefaultAsync(a => a.Username == username);

            if (account is null)
            {
                log.Error($"Unable to associate FaceID with account {username} because the account was not found in database");
                return false;
            }

            account.FaceID = faceID;
            try
            {
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly associate FaceID with account {account.Username}");
                return true;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return false;
            }
        }
    }
}

