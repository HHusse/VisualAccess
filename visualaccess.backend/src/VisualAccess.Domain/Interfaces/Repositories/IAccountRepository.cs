using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IAccountRepository
    {
        public Task<DatabaseResult> CreateAccount(Account account);
        public Task<DTOBase?> GetAccountByUsername(string username);
        public Task<DatabaseResult> AssociateFaceID(Account account, int faceID);
        public Task<bool> UsernameExist(string username);
        public Task<bool> EmailExist(string email);
        public Task<DatabaseResult> RemoveAccount(Account account);
        public Task<DatabaseResult> AddRoomPermission(Account account, Room room);
        public Task<DatabaseResult> RemoveRoomPermission(Account account, Room room);
        public Task<bool> FaceAlreadyAssociated(int faceId);
        public Task<DTOBase?> GetAccountByFaceId(int faceId);
        public Task<DatabaseResult> CleanupPermissionsAfterRoomRemoval(string roomName);
    }
}

