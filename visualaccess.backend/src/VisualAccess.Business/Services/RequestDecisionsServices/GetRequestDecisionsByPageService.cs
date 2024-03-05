using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.RequestDecisionsServices;

public class GetRequestDecisionsByPageService
{
    private readonly ILog log = LogManager.GetLogger(typeof(GetRequestDecisionsByPageService));
    private readonly IRequestDecisionsRepository requestDecisionsRepository;
    private readonly IGenericMapper mapper;

    public GetRequestDecisionsByPageService(IRequestDecisionsRepository requestDecisionsRepository, IGenericMapper mapper)
    {
        this.requestDecisionsRepository = requestDecisionsRepository;
        this.mapper = mapper;
    }

    public async Task<(ServiceResult, List<RequestDecisions>?, long)> Execute(int page)
    {
        List<RequestDecisionsDTO> requests = (List<RequestDecisionsDTO>)await requestDecisionsRepository.GetRequestDecisionByPage(page);
        long requestsCount = await requestDecisionsRepository.GetRequestsCount();
        double pagesDouble = (double)requestsCount / 5;
        long pages = (long)Math.Ceiling(pagesDouble);

        if (requests.Count() == 0)
        {
            log.Warn($"No request found for page {page}");
            return new(ServiceResult.NOT_FOUND, null, 0);
        }

        log.Info($"Fetched {requests.Count()} requests");
        List<RequestDecisions> requestsList = mapper.Map<List<RequestDecisionsDTO>, List<RequestDecisions>>(requests);
        return new(ServiceResult.OK, requestsList, pages);
    }
}
