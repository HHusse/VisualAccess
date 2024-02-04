using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IFaceRepository
    {
        public Task<DTOBase?> GetFace(int id);
        public Task<DatabaseResult> RemoveFace(DTOBase faceDTO);
    }
}

