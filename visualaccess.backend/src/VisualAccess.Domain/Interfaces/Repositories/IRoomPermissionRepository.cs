using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IRoomPermissionRepository
    {
        public Task<DatabaseResult> AddRoomPermissionToAccount(Account account, Room room);
        public Task<DatabaseResult> RemoveRoomPermissionToAccount(Account account, Room room);
        public Task<DatabaseResult> AccountHasRoomPermission(Account account, Room room);
    }
}

