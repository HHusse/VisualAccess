using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Entities;

public record RequestDecisions(string id, string approver, string username, string room, RequestRoomPermissionType type, bool isApproved, long time);
