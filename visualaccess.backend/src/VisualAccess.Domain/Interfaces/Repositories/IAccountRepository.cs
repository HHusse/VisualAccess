using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IAccountRepository
    {
        public Task<DatabaseResult> CreateAccount(Account account);
        public Task<DTOBase?> GetAccountByUsername(string username);
        public Task<DatabaseResult> AssociateFaceID(DTOBase accountDTO, int faceID);
        public Task<bool> UsernameExist(string username);
        public Task<bool> EmailExist(string email);
        public Task<DatabaseResult> RemoveAccount(DTOBase accountDTO);
    }
}

