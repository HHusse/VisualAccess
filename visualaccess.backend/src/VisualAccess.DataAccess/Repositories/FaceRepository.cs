using System;
using System.Security.Principal;
using log4net;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Context;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
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

        public async Task<DTOBase?> GetFace(int id)
        {
            FaceDTO? searchedFace = await dbContext.Faces.FirstOrDefaultAsync(f => f.Id == id);

            if (searchedFace is not null)
            {
                log.Info($"Face with id {id} was found in database");
            }
            else
            {
                log.Warn($"Face with id {id} was not found in database");
            }

            return searchedFace;
        }

        public async Task<DatabaseResult> RemoveFace(DTOBase faceDTO)
        {
            if (faceDTO is not FaceDTO faceDTOCasted)
            {
                log.Error($"Invalid operation: Provided DTOBase is not an FaceDTO.");
                return DatabaseResult.INVALID_OPERATION;
            }

            try
            {
                dbContext.Faces.Remove(faceDTOCasted);
                await dbContext.SaveChangesAsync();
                log.Info($"Succesfuly removed the face with id {faceDTOCasted.Id} from database");
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

