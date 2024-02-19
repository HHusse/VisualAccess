using VisualAccess.Domain.Entities;

namespace VisualAccess.Domain.Interfaces.Factories;

public interface ITemporaryRoomPermissionFactory
{
    public TemporaryRoomPermission Create(string roomName, long from, long until);
}
