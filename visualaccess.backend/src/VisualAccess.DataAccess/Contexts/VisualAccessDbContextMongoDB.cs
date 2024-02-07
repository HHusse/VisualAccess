using System;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MongoDB.Driver;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Contexts;

namespace VisualAccess.DataAccess.Contexts
{
    public class VisualAccessDbContextMongoDB : IVisualAccessDbContextMongoDB
    {
        private readonly IMongoDatabase database;
        public IMongoCollection<AccountDTO> AccountsCollection { get; set; }
        public IMongoCollection<RoomDTO> RoomsCollection { get; set; }
        public IMongoCollection<EntranceRecordDTO> EntranceRecordsCollection { get; set; }

        public VisualAccessDbContextMongoDB(IMongoDatabase database)
        {
            this.database = database;
            AccountsCollection = database.GetCollection<AccountDTO>("accounts");
            RoomsCollection = database.GetCollection<RoomDTO>("rooms");
            EntranceRecordsCollection = database.GetCollection<EntranceRecordDTO>("entranceRecords");
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
                AccountsCollection.InsertOne(defaultAccount);
            }
            catch (Exception)
            {
                return;
            }
        }
    }
}

