using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IAccountRepository
    {
        public Task<DatabaseResult> CreateAccount(Account account);
        public Task<DatabaseResult> UpdateAccount(Account account);
        public Task<DatabaseResult> RemoveAccount(Account account);
        public Task<IDtoBase?> GetAccount(string username);
        public Task<IDtoBase?> GetAccount(int faceId);
        public Task<IEnumerable<IDtoBase>> GetAccountsByPage(int pageNumber, int pageSize = 5);
        public Task<long> GetAccountCount();

        public Task<bool> UsernameExist(string username);
        public Task<bool> EmailExist(string email);
        public Task<bool> FaceAlreadyAssociated(int faceId);
        public Task<DatabaseResult> CleanupPermissionsAfterRoomRemoval(string roomName);
    }
}

