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
using VisualAccess.Domain.Interfaces.Contexts;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Mappers;

namespace VisualAccess.DataAccess.Repositories
{
    public class AccountRepository : IAccountRepository
    {
        private readonly VisualAccessDbContextMongoDB dbContext;
        private readonly ILog log = LogManager.GetLogger("Database");

        public AccountRepository(IVisualAccessDbContextMongoDB dbContext)
        {
            this.dbContext = (VisualAccessDbContextMongoDB)dbContext;
        }

        public async Task<DatabaseResult> CreateAccount(Account account)
        {
            AccountDTO newAccount = Mapper<Account, AccountDTO>.Map(account);
            newAccount.CreatedAt = DateTimeOffset.Now.ToUnixTimeSeconds();
            newAccount.Username = newAccount.Username!.ToLower();
            newAccount.Email = newAccount.Email!.ToLower();

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

        public async Task<DatabaseResult> AssociateFaceID(Account account, int faceID)
        {
            bool faceAlreadyAssociated = await FaceAlreadyAssociated(faceID);
            if (faceAlreadyAssociated)
            {
                return DatabaseResult.FACE_ALREADY_ASSOCIATED;
            }

            var filter = Builders<AccountDTO>.Filter.Eq(a => a.Username, account.Username.ToLower());
            var update = Builders<AccountDTO>.Update.Set(a => a.FaceID, faceID);

            try
            {
                var result = await dbContext.AccountsCollection.UpdateOneAsync(filter, update);
                if (result.MatchedCount == 0)
                {
                    return DatabaseResult.ACCOUNT_NOT_FOUND;
                }

                log.Info($"FaceID associated with account ID {account.Username}.");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<bool> EmailExist(string email)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.Email, email);
            var count = await dbContext.AccountsCollection.CountDocumentsAsync(filter);
            return count > 0;
        }

        public async Task<DTOBase?> GetAccountByUsername(string username)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.Username, username.ToLower());
            return await dbContext.AccountsCollection.Find(filter).FirstOrDefaultAsync();
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

        public async Task<bool> UsernameExist(string username)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.Username, username.ToLower());
            var count = await dbContext.AccountsCollection.CountDocumentsAsync(filter);
            return count > 0;
        }

        public async Task<DatabaseResult> AddRoomPermission(Account account, Room room)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.Id, account.Id);
            var update = Builders<AccountDTO>.Update.AddToSet(a => a.AllowedRooms, room.Name);

            try
            {
                var updateResult = await dbContext.AccountsCollection.UpdateOneAsync(filter, update);

                if (updateResult.MatchedCount == 0)
                {
                    log.Warn($"Account with ID {account.Id} not found for adding room permission.");
                    return DatabaseResult.ACCOUNT_NOT_FOUND;
                }

                log.Info($"Room permission for {room.Name} added to account with ID {account.Id}.");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DatabaseResult> RemoveRoomPermission(Account account, Room room)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.Id, account.Id);
            var update = Builders<AccountDTO>.Update.Pull(a => a.AllowedRooms, room.Name);

            try
            {
                var updateResult = await dbContext.AccountsCollection.UpdateOneAsync(filter, update);

                if (updateResult.MatchedCount == 0)
                {
                    log.Warn($"Account with ID {account.Id} not found for removing room permission.");
                    return DatabaseResult.ACCOUNT_NOT_FOUND;
                }

                log.Info($"Room permission for {room.Name} removed from account with ID {account.Id}.");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<bool> FaceAlreadyAssociated(int faceId)
        {
            var filter = Builders<AccountDTO>.Filter.Eq(a => a.FaceID, faceId);
            var count = await dbContext.AccountsCollection.CountDocumentsAsync(filter);
            return count > 0;
        }
    }
}

