using log4net;
using MongoDB.Driver;
using VisualAccess.DataAccess.Contexts;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Exceptions;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.DataAccess.Repositories;

public class RequestDecisionsRepository : IRequestDecisionsRepository
{
    private readonly ILog log = LogManager.GetLogger("Database");
    private readonly VisualAccessDbContextMongoDB dbContext;
    private readonly IGenericMapper mapper;

    public RequestDecisionsRepository(VisualAccessDbContextMongoDB dbContext, IGenericMapper mapper)
    {
        this.dbContext = dbContext;
        this.mapper = mapper;
    }

    public async Task<DatabaseResult> AddRequestDecision(RequestDecisions requestDecision)
    {
        try
        {
            var requestDecisionDTO = mapper.Map<RequestDecisions, RequestDecisionsDTO>(requestDecision);
            await dbContext.RequestDecisionsCollection.InsertOneAsync(requestDecisionDTO);
            return DatabaseResult.OK;
        }
        catch (Exception ex)
        {
            log.Error($"Error adding request decision: {ex.Message}");
            return DatabaseResult.UNKNOWN_ERROR;
        }
    }

    public async Task<IEnumerable<DTOBase>> GetRequestDecisionByPage(int pageNumber, int pageSize = 5)
    {
        try
        {
            int skip = (pageNumber - 1) * pageSize;

            var filter = Builders<RequestDecisionsDTO>.Filter.Empty;

            var requestDecisions = await dbContext.RequestDecisionsCollection
                .Find(filter)
                .Skip(skip)
                .Limit(pageSize)
                .ToListAsync();

            log.Info($"Found {requestDecisions.Count} request desicions on page {pageNumber}.");

            return requestDecisions;
        }
        catch (Exception e)
        {
            LogException.Log(log, e);
            throw;
        }
    }

    public async Task<long> GetRequestsCount()
    {
        try
        {
            long count = await dbContext.RequestDecisionsCollection.CountDocumentsAsync(Builders<RequestDecisionsDTO>.Filter.Empty);
            log.Info($"Found {count} request decisions.");
            return count;
        }
        catch (Exception e)
        {
            LogException.Log(log, e);
            throw;
        }
    }
}
