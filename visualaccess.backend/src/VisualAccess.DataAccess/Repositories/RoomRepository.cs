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
    public class RoomRepository : IRoomRepository
    {
        private readonly VisualAccessDbContext dbContext;
        private readonly ILog log = LogManager.GetLogger("Database");

        public RoomRepository(VisualAccessDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<DatabaseResult> AddNewRoom(Room room)
        {
            RoomDTO roomDTO = new(room.Name);
            try
            {
                await dbContext.Rooms.AddAsync(roomDTO);
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly added new room {room.Name}");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DTOBase?> GetRoom(string roomName)
        {
            RoomDTO? searchedRoom = await dbContext.Rooms.FirstOrDefaultAsync(r => r.Name == roomName.ToLower());
            if (searchedRoom is not null)
            {
                log.Info($"Room with name {roomName.ToLower()} was found in database");
            }
            else
            {
                log.Warn($"Room with name {roomName.ToLower()} was not found in database");
            }

            return searchedRoom;
        }

        public async Task<DatabaseResult> RemoveRoom(DTOBase roomDTO)
        {
            if (roomDTO is not RoomDTO roomDTOCasted)
            {
                log.Error($"Invalid operation: Provided DTOBase is not an RoomDTO.");
                return DatabaseResult.INVALID_OPERATION;
            }

            try
            {
                dbContext.Rooms.Remove(roomDTOCasted);
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly removed the room with name {roomDTOCasted.Name}");
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

