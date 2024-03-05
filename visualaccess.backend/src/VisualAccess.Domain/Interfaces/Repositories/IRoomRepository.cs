using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IRoomRepository
    {
        public Task<DatabaseResult> AddNewRoom(Room room);
        public Task<DatabaseResult> RemoveRoom(Room room);
        public Task<DTOBase?> GetRoom(string roomName);
        public Task<DatabaseResult> RoomExist(string room);
        public Task<IEnumerable<DTOBase>> GetRoomsByPage(int pageNumber, int pageSize = 5);
        public Task<long> GetRoomsCount();
    }
}

