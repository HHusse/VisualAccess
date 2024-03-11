using System;
using log4net;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MongoDB.Driver;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;

namespace VisualAccess.DataAccess.Contexts
{
    public class VisualAccessDbContextMongoDB
    {
        private readonly ILog log = LogManager.GetLogger(typeof(VisualAccessDbContextMongoDB));
        public IMongoCollection<AccountDto> AccountsCollection { get; set; }
        public IMongoCollection<RoomDto> RoomsCollection { get; set; }
        public IMongoCollection<EntranceRecordDto> EntranceRecordsCollection { get; set; }
        public IMongoCollection<RequestRoomPermissionDto> RequestRoomPermissionCollection { get; set; }
        public IMongoCollection<RequestDecisionsDto> RequestDecisionsCollection { get; set; }


        public VisualAccessDbContextMongoDB(IMongoDatabase database)
        {
            AccountsCollection = database.GetCollection<AccountDto>("accounts");
            RoomsCollection = database.GetCollection<RoomDto>("rooms");
            EntranceRecordsCollection = database.GetCollection<EntranceRecordDto>("entranceRecords");
            RequestRoomPermissionCollection = database.GetCollection<RequestRoomPermissionDto>("requestRoomPermission");
            RequestDecisionsCollection = database.GetCollection<RequestDecisionsDto>("requestDecisions");
        }

        public void Configure()
        {
            var usernameIndexModel = new CreateIndexModel<AccountDto>(
                Builders<AccountDto>.IndexKeys.Ascending(x => x.Username),
                new CreateIndexOptions { Unique = true });

            var emailIndexModel = new CreateIndexModel<AccountDto>(
                Builders<AccountDto>.IndexKeys.Ascending(x => x.Email),
                new CreateIndexOptions { Unique = true });

            AccountsCollection.Indexes.CreateOne(usernameIndexModel);
            AccountsCollection.Indexes.CreateOne(emailIndexModel);

            var roomNameIndexModel = new CreateIndexModel<RoomDto>(
                Builders<RoomDto>.IndexKeys.Ascending(x => x.Name),
                new CreateIndexOptions { Unique = true });

            RoomsCollection.Indexes.CreateOne(roomNameIndexModel);

            AccountDto defaultAccount = new AccountDto
            {
                Id = Guid.NewGuid().ToString(),
                FirstName = "",
                LastName = "",
                Username = "setup",
                Password = BCrypt.Net.BCrypt.HashPassword("visualaccess"),
                Email = "",
                PhoneNumber = "",
                Role = Domain.Enumerations.Role.ADMIN,
                CreatedAt = DateTimeOffset.Now.ToUnixTimeSeconds()
            };
            try
            {
                if (AccountsCollection.CountDocuments(Builders<AccountDto>.Filter.Empty) == 0)
                {
                    AccountsCollection.InsertOne(defaultAccount);
                }
            }
            catch (Exception)
            {
                log.Warn("Skipping adding the default account");
            }
        }
    }
}

