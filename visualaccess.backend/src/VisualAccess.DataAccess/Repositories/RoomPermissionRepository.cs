using System;
using System.Security.Principal;
using System.Xml.Linq;
using log4net;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Context;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Exceptions;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.DataAccess.Repositories
{
    public class RoomPermissionRepository : IRoomPermissionRepository
    {
        private readonly VisualAccessDbContext dbContext;
        private readonly ILog log = LogManager.GetLogger("Database");

        public RoomPermissionRepository(VisualAccessDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<DatabaseResult> AccountHasRoomPermission(Account account, Room room)
        {
            var roomPermission = await dbContext.RoomPermissions.FirstOrDefaultAsync(rp => rp.RoomId == room.Id && rp.AccountId == account.Id);
            return roomPermission != null ? DatabaseResult.OK : DatabaseResult.ROOM_PERMISSION_NOT_FOUND;
        }

        public async Task<DatabaseResult> AddRoomPermissionToAccount(Account account, Room room)
        {
            var roomPermission = await dbContext.RoomPermissions.FirstOrDefaultAsync(rp => rp.RoomId == room.Id && rp.AccountId == account.Id);
            if (roomPermission is not null)
            {
                return DatabaseResult.ROOM_PERMISSION_ALREADY_EXIST;
            }

            RoomPermissionDTO newPermision = new(account.Id, room.Id);
            try
            {
                await dbContext.RoomPermissions.AddAsync(newPermision);
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly added new room permission for account {account.Username} in room {room.Name}");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }

        }

        public async Task<DatabaseResult> RemoveRoomPermissionToAccount(Account account, Room room)
        {
            var roomPermission = await dbContext.RoomPermissions.FirstOrDefaultAsync(rp => rp.RoomId == room.Id && rp.AccountId == account.Id);
            if (roomPermission is null)
            {
                return DatabaseResult.ROOM_PERMISSION_NOT_FOUND;
            }

            try
            {
                dbContext.RoomPermissions.Remove(roomPermission);
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly removed room permission for account {account.Username} in room {room.Name}");
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

