using System;
namespace VisualAccess.Domain.Enumerations
{
    public enum ServiceResult
    {
        OK,
        INVALID_USERNAME,
        INVALID_EMAIL,
        INVALID_PHONE_NUMBER,
        INVALID_OPERATION,
        ACCOUNT_ALREADY_EXIST,
        EMAIL_ALREADY_EXIST,
        ACCOUNT_NOT_FOUND,
        ROOM_NOT_FOUND,
        ROOM_ALREADY_EXIST,
        WRONG_PASSWORD,
        FACE_ASSOCIATION_FAIL,
        FACE_NOT_FOUND,
        FACE_ALREADY_EXIST,
        FACE_NOT_REGISTERD,
        ACCOUNT_HAS_NO_PERMISSION,
        NOT_FOUND,
        SAME_PASSWORD,
        ROOM_PERMISSION_ALREADY_EXIST,
        REQUEST_ALREADY_EXIST,
        REQUEST_NOT_FOUND,
        FAIL_TO_SEND_EMAIL,
        UNKNOWN_ERROR,
        DATABASE_ERROR
    }
}

