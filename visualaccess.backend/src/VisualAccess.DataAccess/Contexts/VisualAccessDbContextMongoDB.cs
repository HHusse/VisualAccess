using System;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MongoDB.Driver;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;

namespace VisualAccess.DataAccess.Contexts
{
    public class VisualAccessDbContextMongoDB
    {
        private readonly IMongoDatabase database;
        public IMongoCollection<AccountDTO> AccountsCollection { get; set; }
        public IMongoCollection<RoomDTO> RoomsCollection { get; set; }
        public IMongoCollection<EntranceRecordDTO> EntranceRecordsCollection { get; set; }
        public IMongoCollection<RequestRoomPermissionDTO> RequestRoomPermissionCollection { get; set; }
        public IMongoCollection<RequestDecisionsDTO> RequestDecisionsCollection { get; set; }


        public VisualAccessDbContextMongoDB(IMongoDatabase database)
        {
            this.database = database;
            AccountsCollection = database.GetCollection<AccountDTO>("accounts");
            RoomsCollection = database.GetCollection<RoomDTO>("rooms");
            EntranceRecordsCollection = database.GetCollection<EntranceRecordDTO>("entranceRecords");
            RequestRoomPermissionCollection = database.GetCollection<RequestRoomPermissionDTO>("requestRoomPermission");
            RequestDecisionsCollection = database.GetCollection<RequestDecisionsDTO>("requestDecisions");
        }

        public void Configure()
        {
            var usernameIndexModel = new CreateIndexModel<AccountDTO>(
                Builders<AccountDTO>.IndexKeys.Ascending(x => x.Username),
                new CreateIndexOptions { Unique = true });

            var emailIndexModel = new CreateIndexModel<AccountDTO>(
                Builders<AccountDTO>.IndexKeys.Ascending(x => x.Email),
                new CreateIndexOptions { Unique = true });

            AccountsCollection.Indexes.CreateOne(usernameIndexModel);
            AccountsCollection.Indexes.CreateOne(emailIndexModel);

            var roomNameIndexModel = new CreateIndexModel<RoomDTO>(
                Builders<RoomDTO>.IndexKeys.Ascending(x => x.Name),
                new CreateIndexOptions { Unique = true });

            RoomsCollection.Indexes.CreateOne(roomNameIndexModel);

            AccountDTO defaultAccount = new AccountDTO
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
                if (AccountsCollection.CountDocuments(Builders<AccountDTO>.Filter.Empty) == 0)
                {
                    AccountsCollection.InsertOne(defaultAccount);
                }
            }
            catch (Exception)
            {
                return;
            }
        }
    }
}

