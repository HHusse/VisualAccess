using System;
using System.Security.Principal;
using log4net;
using VisualAccess.DataAccess.Context;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Exceptions;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.DataAccess.Repositories
{
    public class FaceRepository : IFaceRepository
    {
        private readonly VisualAccessDbContext dbContext;
        private readonly ILog log = LogManager.GetLogger("Database");

        public FaceRepository(VisualAccessDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<bool> RemoveFace(int id)
        {
            var face = dbContext.Faces.FirstOrDefault(f => f.Id == id);

            if (face is null)
            {
                log.Warn($"Face with id {id} was not found in database");
                return false;
            }

            try
            {
                dbContext.Faces.Remove(face);
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly removed the face with id {face.Id} from database");
                return true;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return false;
            }
        }
    }
}

