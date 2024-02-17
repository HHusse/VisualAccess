using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Factories;

namespace VisualAccess.Business.Factories
{
    public class RequestRoomPermissionFactory : IRequestRoomPermissionFactory
    {
        public RequestRoomPermission Create(RequestRoomPermissionType type, string roomName, string? requestMessage)
        {
            return new RequestRoomPermission
            {
                Type = type,
                RoomName = roomName,
                RequestMessage = requestMessage
            };
        }
    }
}

