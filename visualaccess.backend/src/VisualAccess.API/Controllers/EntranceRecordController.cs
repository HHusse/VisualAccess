using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.Business.Services.EntranceRecordServices;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.API.Controllers;

[ApiController]
[Route("api/entrance/record")]
public class EntranceRecordController : ControllerBase
{
    public readonly ILog log;
    public readonly IEntranceRecordRepository entranceRecordRepository;
    public readonly IGenericMapper mapper;

    public EntranceRecordController(ILog log, IEntranceRecordRepository entranceRecordRepository, IGenericMapper mapper)
    {
        this.log = log;
        this.entranceRecordRepository = entranceRecordRepository;
        this.mapper = mapper;
    }

    [HttpGet("/api/entrance/record/{page}")]
    [Authorize(Roles = "ADMIN,HR")]
    public async Task<IActionResult> GetEntranceRecordsByPage([FromRoute] int page)
    {
        log.Info($"Fetching entrance records for page {page}");
        GetEntranceRecordByPageService getEntranceRecordsByPageService = new(entranceRecordRepository, mapper);
        (ServiceResult, List<EntranceRecord>?, long) result = await getEntranceRecordsByPageService.Execute(page);
        return result.Item1 switch
        {
            ServiceResult.OK => StatusCode(200, new
            {
                maxPages = result.Item3,
                records = result.Item2!.Select(record => new
                {
                    record.id,
                    record.username,
                    record.roomName,
                    record.time,
                    record.hasEntered
                })
            }),
            ServiceResult.NOT_FOUND => StatusCode(400, new { message = "No entrance records found for the requested page" }),
            _ => StatusCode(500, new { message = "Something went wrong" })
        };

    }
}
