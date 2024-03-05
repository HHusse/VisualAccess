using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories;

public interface IRequestDecisionsRepository
{
    public Task<DatabaseResult> AddRequestDecision(RequestDecisions requestDecision);
    public Task<IEnumerable<DTOBase>> GetRequestDecisionByPage(int pageNumber, int pageSize = 5);
    public Task<long> GetRequestsCount();
}
