using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.Business.Services.RequestDecisionsServices;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.API.Controllers;

[Route("api/v1/request/decision")]
[Authorize(Policy = "AccountRequest")]
public class RequestDecisionsControllers : ControllerBase
{
    private readonly IRequestDecisionsRepository requestDecisionsRepository;
    private readonly IGenericMapper mapper;

    public RequestDecisionsControllers(IRequestDecisionsRepository requestDecisionsRepository, IGenericMapper mapper)
    {
        this.requestDecisionsRepository = requestDecisionsRepository;
        this.mapper = mapper;
    }

    [HttpGet("/api/v1/request/decisions/{page}")]
    [Authorize(Roles = "ADMIN")]
    public async Task<IActionResult> GetRequestDecisionsByPage([FromRoute] int page)
    {
        var service = new GetRequestDecisionsByPageService(requestDecisionsRepository, mapper);
        var (result, requests, maxPages) = await service.Execute(page);

        switch (result)
        {
            case ServiceResult.NOT_FOUND:
                return StatusCode(404, new { message = "No requests found for the requested page" });
        }

        var requestsResponse = requests!.Select(req => new
        {
            req.approver,
            req.username,
            req.room,
            type = req.type.ToString(),
            req.isApproved,
            req.time
        });

        return StatusCode(200, new { maxPages, requests = requestsResponse });
    }
}
