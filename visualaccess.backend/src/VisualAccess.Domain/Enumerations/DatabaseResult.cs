using System;
namespace VisualAccess.Domain.Enumerations
{
    public enum DatabaseResult
    {
        OK,
        ACCOUNT_NOT_FOUND,
        NO_FACE_ASSOCIATED,
        FACE_NOT_FOUND,
        ROOM_ALREADY_EXIST,
        ROOM_NOT_FOUND,
        ROOM_PERMISSION_NOT_FOUND,
        ROOM_PERMISSION_ALREADY_EXIST,
        INVALID_OPERATION,
        UNKNOWN_ERROR
    }
}

