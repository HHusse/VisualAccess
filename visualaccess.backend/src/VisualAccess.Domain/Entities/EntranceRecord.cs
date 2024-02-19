using System;
namespace VisualAccess.Domain.Entities
{
    public record EntranceRecord(string id, string username, string roomName, long time, bool hasEntered);
}

