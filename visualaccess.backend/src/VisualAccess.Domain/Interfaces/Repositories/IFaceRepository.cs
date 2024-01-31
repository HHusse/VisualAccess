using System;
namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IFaceRepository
    {
        public Task<bool> RemoveFace(int id);
    }
}

