using System;
namespace VisualAccess.Domain.Entities
{
    public record EntranceRecord(string username, string roomName, long time, bool hasEntered);
}

