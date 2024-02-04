using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IRoomRepository
    {
        public Task<DatabaseResult> AddNewRoom(Room room);
        public Task<DatabaseResult> RemoveRoom(DTOBase roomDTO);
        public Task<DTOBase?> GetRoom(string room);
    }
}

