using System;
using VisualAccess.Domain.Entities;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IAccountRepository
    {
        public Task<bool> CreateAccount(Account account);
        public Task<DTOBase?> GetAccountByUsername(string username);
        public Task<bool> AssociateFaceID(string username, int faceID);
    }
}

