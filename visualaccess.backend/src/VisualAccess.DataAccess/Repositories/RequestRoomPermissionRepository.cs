using System;
using log4net;
using MongoDB.Driver;
using VisualAccess.DataAccess.Contexts;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Exceptions;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.DataAccess.Repositories
{
    public class RequestRoomPermissionRepository : IRequestRoomPermissionRepository
    {
        private readonly ILog log = LogManager.GetLogger("Database");
        private readonly VisualAccessDbContextMongoDB dbContext;
        private readonly IGenericMapper mapper;

        public RequestRoomPermissionRepository(VisualAccessDbContextMongoDB dbContext, IGenericMapper mapper)
        {
            this.dbContext = dbContext;
            this.mapper = mapper;
        }

        public async Task<DatabaseResult> CreateRequest(RequestRoomPermission requestRoomPermission)
        {
            RequestRoomPermissionDTO newRequest = mapper.Map<RequestRoomPermission, RequestRoomPermissionDTO>(requestRoomPermission);

            try
            {
                await dbContext.RequestRoomPermissionCollection.InsertOneAsync(newRequest);
                log.Info($"Request room permission for account {newRequest.Username} in room {newRequest.RoomName} was added succesfuly.");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DatabaseResult> DeleteRequest(RequestRoomPermission requestRoomPermission)
        {
            try
            {
                var deleteResult = await dbContext.RequestRoomPermissionCollection.DeleteOneAsync(r => r.Id == requestRoomPermission.Id);

                if (deleteResult.DeletedCount <= 0)
                {
                    log.Warn($"Request room permission with ID {requestRoomPermission.Id} was not found.");
                    return DatabaseResult.REQUEST_NOT_FOUND;
                }

                log.Info($"Request room permission with ID {requestRoomPermission.Id} was deleted successfully.");
                return DatabaseResult.OK;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return DatabaseResult.UNKNOWN_ERROR;
            }
        }

        public async Task<DTOBase?> GetById(string requestId)
        {
            try
            {
                var filter = Builders<RequestRoomPermissionDTO>.Filter.Eq(r => r.Id, requestId);
                var requestDto = await dbContext.RequestRoomPermissionCollection.Find(filter).FirstOrDefaultAsync();

                if (requestDto is null)
                {
                    log.Warn($"Request room permission with ID {requestId} was not found.");
                    return null;
                }

                log.Info($"Found request room permission with ID {requestId}.");
                return requestDto;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                throw;
            }
        }

        public async Task<IEnumerable<DTOBase>> GetByPage(int pageNumber, int pageSize = 5)
        {
            try
            {
                int skip = (pageNumber - 1) * pageSize;

                var filter = Builders<RequestRoomPermissionDTO>.Filter.Empty;

                var requests = await dbContext.RequestRoomPermissionCollection
                    .Find(filter)
                    .Skip(skip)
                    .Limit(pageSize)
                    .ToListAsync();

                log.Info($"Found {requests.Count} request room permissions on page {pageNumber}.");

                return requests;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                throw;
            }
        }

        public async Task<bool> RequestExists(string username, string roomName)
        {
            try
            {
                var filter = Builders<RequestRoomPermissionDTO>.Filter.And(
                    Builders<RequestRoomPermissionDTO>.Filter.Eq(r => r.Username, username),
                    Builders<RequestRoomPermissionDTO>.Filter.Eq(r => r.RoomName, roomName));

                var count = await dbContext.RequestRoomPermissionCollection.CountDocumentsAsync(filter);

                return count > 0;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                throw;
            }
        }


    }
}

