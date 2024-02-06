using System;
using System.Security.Principal;
using log4net;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Contexts;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Exceptions;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.DataAccess.Repositories
{
    public class FaceRepository : IFaceRepository
    {
        private readonly VisualAccessDbContextPgSQL dbContext;
        private readonly ILog log = LogManager.GetLogger("Database");

        public FaceRepository(VisualAccessDbContextPgSQL dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<DatabaseResult> RemoveFace(int id)
        {
            var faceId = await dbContext.Faces.FirstOrDefaultAsync(f => f.Id == id);
            if (faceId is null)
            {
                log.Error($"The face with id {id} was not found in database");
                return DatabaseResult.FACE_NOT_FOUND;
            }

            try
            {
                dbContext.Faces.Remove(faceId);
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly removed the face with id {faceId.Id} from database");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }
    }
}

