using System;
namespace VisualAccess.Domain.Enumerations
{
    public enum DatabaseResult
    {
        OK,
        ACCOUNT_NOT_FOUND,
        ACCOUNT_AlREADY_EXIST,
        NO_FACE_ASSOCIATED,
        FACE_NOT_FOUND,
        FACE_ALREADY_ASSOCIATED,
        ROOM_ALREADY_EXIST,
        ROOM_EXIST,
        ROOM_NOT_FOUND,
        ROOM_PERMISSION_NOT_FOUND,
        ROOM_PERMISSION_ALREADY_EXIST,
        REQUEST_NOT_FOUND,
        INVALID_OPERATION,
        UNKNOWN_ERROR
    }
}

