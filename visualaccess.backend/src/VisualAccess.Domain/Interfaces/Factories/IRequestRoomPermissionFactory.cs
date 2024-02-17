using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Factories
{
    public interface IRequestRoomPermissionFactory
    {
        public RequestRoomPermission Create(RequestRoomPermissionType type, string roomName, string? requestMessage);
    }
}

