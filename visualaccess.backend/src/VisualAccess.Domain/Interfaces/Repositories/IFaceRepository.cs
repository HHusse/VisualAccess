using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IFaceRepository
    {
        public Task<DatabaseResult> RemoveFace(int id);
    }
}

