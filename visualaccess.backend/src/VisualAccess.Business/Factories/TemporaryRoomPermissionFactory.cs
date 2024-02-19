using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Factories;

namespace VisualAccess.Business.Factories;

public class TemporaryRoomPermissionFactory : ITemporaryRoomPermissionFactory
{
    public TemporaryRoomPermission Create(string roomName, long from, long until)
    {
        return new TemporaryRoomPermission
        {
            Room = roomName,
            From = from,
            Until = until
        };
    }
}
