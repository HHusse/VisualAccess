﻿using System;
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
            AccountDto newAccount = mapper.Map<Account, AccountDto>(account);

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
                ExceptionLogger.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DatabaseResult> UpdateAccount(Account account)
        {
            AccountDto updatedAccountDto = mapper.Map<Account, AccountDto>(account);

            updatedAccountDto.Id = account.Id;

            var filter = Builders<AccountDto>.Filter.Eq(a => a.Id, updatedAccountDto.Id);

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
                ExceptionLogger.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DatabaseResult> RemoveAccount(Account account)
        {
            var filter = Builders<AccountDto>.Filter.Eq(a => a.Id, account.Id);

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
                ExceptionLogger.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<IDtoBase?> GetAccount(string username)
        {
            var filter = Builders<AccountDto>.Filter.Eq(a => a.Username, username.ToLower());
            return await dbContext.AccountsCollection.Find(filter).FirstOrDefaultAsync();
        }

        public async Task<IDtoBase?> GetAccount(int faceId)
        {
            var filter = Builders<AccountDto>.Filter.Eq(a => a.FaceID, faceId);
            return await dbContext.AccountsCollection.Find(filter).FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<IDtoBase>> GetAccountsByPage(int pageNumber, int pageSize = 5)
        {
            try
            {
                int skip = (pageNumber - 1) * pageSize;

                var filter = Builders<AccountDto>.Filter.Empty;

                var accounts = await dbContext.AccountsCollection
                    .Find(filter)
                    .Skip(skip)
                    .Limit(pageSize)
                    .ToListAsync();

                log.Info($"Found {accounts.Count} acounts on page {pageNumber}");
                return accounts;
            }
            catch (Exception e)
            {
                ExceptionLogger.Log(log, e);
                throw;
            }
        }

        public async Task<long> GetAccountCount()
        {
            var filter = Builders<AccountDto>.Filter.Empty;
            return await dbContext.AccountsCollection.CountDocumentsAsync(filter);
        }

        public async Task<bool> UsernameExist(string username)
        {
            var filter = Builders<AccountDto>.Filter.Eq(a => a.Username, username.ToLower());
            var count = await dbContext.AccountsCollection.CountDocumentsAsync(filter);
            return count > 0;
        }

        public async Task<bool> EmailExist(string email)
        {
            var filter = Builders<AccountDto>.Filter.Eq(a => a.Email, email);
            var count = await dbContext.AccountsCollection.CountDocumentsAsync(filter);
            return count > 0;
        }

        public async Task<bool> FaceAlreadyAssociated(int faceId)
        {
            var filter = Builders<AccountDto>.Filter.Eq(a => a.FaceID, faceId);
            var count = await dbContext.AccountsCollection.CountDocumentsAsync(filter);
            return count > 0;
        }

        public async Task<DatabaseResult> CleanupPermissionsAfterRoomRemoval(string roomName)
        {
            var filter = Builders<AccountDto>.Filter.Or(
                Builders<AccountDto>.Filter.AnyEq(a => a.AllowedRooms, roomName),
                Builders<AccountDto>.Filter.ElemMatch(a => a.TemporaryRoomPermissions, temp => temp.Room == roomName)
            );

            var updateAllowedRooms = Builders<AccountDto>.Update.Pull(a => a.AllowedRooms, roomName);
            var updateTemporaryPermissions = Builders<AccountDto>.Update.PullFilter(a => a.TemporaryRoomPermissions,
                Builders<TemporaryRoomPermissionDto>.Filter.Eq(temp => temp.Room, roomName));

            var combinedUpdate = Builders<AccountDto>.Update.Combine(updateAllowedRooms, updateTemporaryPermissions);

            try
            {
                var updateResult = await dbContext.AccountsCollection.UpdateManyAsync(filter, combinedUpdate);

                if (updateResult.MatchedCount == 0)
                {
                    log.Warn($"No accounts found with room permission for {roomName} to remove.");
                    return DatabaseResult.ACCOUNT_NOT_FOUND;
                }

                log.Info($"Room permission for {roomName} removed from all accounts, including temporary permissions.");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                ExceptionLogger.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }



    }
}

