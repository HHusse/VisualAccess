using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IRoomRepository
    {
        public Task<DatabaseResult> AddNewRoom(Room room);
        public Task<DatabaseResult> RemoveRoom(Room room);
        public Task<IDtoBase?> GetRoom(string roomName);
        public Task<DatabaseResult> RoomExist(string roomName);
        public Task<IEnumerable<IDtoBase>> GetRoomsByPage(int pageNumber, int pageSize = 5);
        public Task<long> GetRoomsCount();
    }
}

