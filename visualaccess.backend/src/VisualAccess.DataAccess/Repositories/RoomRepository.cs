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
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Mappers;
using static MongoDB.Driver.WriteConcern;

namespace VisualAccess.DataAccess.Repositories
{
    public class RoomRepository : IRoomRepository
    {
        private readonly VisualAccessDbContextMongoDB dbContext;
        private readonly ILog log = LogManager.GetLogger("Database");

        public RoomRepository(VisualAccessDbContextMongoDB dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<DatabaseResult> AddNewRoom(Room room)
        {
            RoomDTO newRoom = Mapper<Room, RoomDTO>.Map(room);

            try
            {
                await dbContext.RoomsCollection.InsertOneAsync(newRoom);
                log.Info($"Room with name {newRoom.Name} created successfully.");
                return DatabaseResult.OK;
            }
            catch (MongoWriteException ex) when (ex.WriteError.Category == ServerErrorCategory.DuplicateKey)
            {
                log.Warn($"Room with name {newRoom.Name} already exist.");
                return DatabaseResult.ACCOUNT_AlREADY_EXIST;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DTOBase?> GetRoom(string roomName)
        {
            var filter = Builders<RoomDTO>.Filter.Eq(r => r.Name, roomName.ToLower());
            try
            {
                var roomDTO = await dbContext.RoomsCollection.Find(filter).FirstOrDefaultAsync();
                if (roomDTO == null)
                {
                    log.Info($"Room with name {roomName} not found.");
                    return null;
                }

                log.Info($"Room with name {roomName} retrieved successfully.");
                return roomDTO;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return null;
            }
        }

        public async Task<DatabaseResult> RemoveRoom(Room room)
        {
            var filter = Builders<RoomDTO>.Filter.Eq(r => r.Id, room.Id);

            try
            {
                var result = await dbContext.RoomsCollection.DeleteOneAsync(filter);
                if (result.DeletedCount == 0)
                {
                    return DatabaseResult.ROOM_NOT_FOUND;
                }

                log.Info($"Room with ID {room.Id} deleted successfully.");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DatabaseResult> RoomExist(string roomName)
        {
            var filter = Builders<RoomDTO>.Filter.Eq(r => r.Name, roomName.ToLower());
            var count = await dbContext.RoomsCollection.CountDocumentsAsync(filter);
            return count > 0 ? DatabaseResult.ROOM_EXIST : DatabaseResult.ROOM_NOT_FOUND;
        }
    }
}

