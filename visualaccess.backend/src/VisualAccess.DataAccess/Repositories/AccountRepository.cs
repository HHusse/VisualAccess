using System;
using System.Security.Principal;
using log4net;
using Microsoft.EntityFrameworkCore;
using MongoDB.Driver;
using VisualAccess.DataAccess.Contexts;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Exceptions;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.DataAccess.Repositories
{
    public class AccountRepository : IAccountRepository
    {
        private readonly ILog log = LogManager.GetLogger("Database");
        private readonly VisualAccessDbContextMongoDB dbContext;
        private readonly IGenericMapper mapper;

        public AccountRepository(VisualAccessDbContextMongoDB dbContext, IGenericMapper mapper)
        {
            this.dbContext = dbContext;
            this.mapper = mapper;
        }

        public async Task<DatabaseResult> CreateAccount(Account account)
        {
            AccountDTO newAccount = mapper.Map<Account, AccountDTO>(account);

            try
            {
                await dbContext.AccountsCollection.InsertOneAsync(newAccount);
                log.Info($"Account with username {newAccount.Username} created successfully.");
                return DatabaseResult.OK;
            }
            catch (MongoWriteException ex) when (ex.WriteError.Category == ServerErrorCategory.DuplicateKey)
            {
                log.Warn($"Account with username {newAccount.Username} already exist.");
                return DatabaseResult.ACCOUNT_AlREADY_EXIST;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DatabaseResult> UpdateAccount(Account account)
        {
            AccountDTO updatedAccountDto = mapper.Map<Account, AccountDTO>(account);

            updatedAccountDto.Id = account.Id;

            var filter = Builders<AccountDTO>.Filter.Eq(a => a.Id, updatedAccountDto.Id);

            try
            {
                var replaceResult = await dbContext.AccountsCollection.ReplaceOneAsync(filter, updatedAccountDto, new ReplaceOptions { IsUpsert = false });

                if (replaceResult.MatchedCount == 0)
                {
                    log.Warn($"Account with ID {account.Id} not found for update.");
                    return DatabaseResult.ACCOUNT_NOT_FOUND;
                }

                log.Info($"Account with username {account.Username} updated successfully.");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DatabaseResult> RemoveAccount(Account account)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.Id, account.Id);

            try
            {
                var result = await dbContext.AccountsCollection.DeleteOneAsync(filter);
                if (result.DeletedCount == 0)
                {
                    return DatabaseResult.ACCOUNT_NOT_FOUND;
                }

                log.Info($"Account with username {account.Username} deleted successfully.");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DTOBase?> GetAccount(string username)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.Username, username.ToLower());
            return await dbContext.AccountsCollection.Find(filter).FirstOrDefaultAsync();
        }

        public async Task<DTOBase?> GetAccount(int faceId)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.FaceID, faceId);
            return await dbContext.AccountsCollection.Find(filter).FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<DTOBase>> GetAccountsByPage(int pageNumber, int pageSize = 5)
        {
            try
            {
                int skip = (pageNumber - 1) * pageSize;

                var filter = Builders<AccountDTO>.Filter.Empty;

                var accounts = await dbContext.AccountsCollection
                    .Find(filter)
                    .Skip(skip)
                    .Limit(pageSize)
                    .ToListAsync();

                log.Info($"Found {accounts.Count()} acounts on page {pageNumber}");
                return accounts;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                throw;
            }
        }


        public async Task<bool> UsernameExist(string username)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.Username, username.ToLower());
            var count = await dbContext.AccountsCollection.CountDocumentsAsync(filter);
            return count > 0;
        }

        public async Task<bool> EmailExist(string email)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.Email, email);
            var count = await dbContext.AccountsCollection.CountDocumentsAsync(filter);
            return count > 0;
        }

        public async Task<bool> FaceAlreadyAssociated(int faceId)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.FaceID, faceId);
            var count = await dbContext.AccountsCollection.CountDocumentsAsync(filter);
            return count > 0;
        }

        public async Task<DatabaseResult> CleanupPermissionsAfterRoomRemoval(string roomName)
        {
            var filter = Builders<AccountDTO>.Filter.AnyEq(a => a.AllowedRooms, roomName);
            var update = Builders<AccountDTO>.Update.Pull(a => a.AllowedRooms, roomName);

            try
            {
                var updateResult = await dbContext.AccountsCollection.UpdateManyAsync(filter, update);

                if (updateResult.MatchedCount == 0)
                {
                    log.Warn($"No accounts found with room permission for {roomName} to remove.");
                    return DatabaseResult.ACCOUNT_NOT_FOUND;
                }

                log.Info($"Room permission for {roomName} removed from all accounts.");
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

