using System;
using System.Linq;
using System.Security.Claims;
using log4net;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;

namespace VisualAccess.API.Controllers
{
    [ApiController]
    [Route("api")]
    public class ApiController : ControllerBase
    {
        private readonly ILog log;

        public ApiController(ILog log)
        {
            this.log = log;
        }

        [HttpGet("v1")]
        public Task<IActionResult> GetApiVersion()
        {
            var response = new
            {
                apiVersion = "v1",
            };
            return Task.FromResult<IActionResult>(StatusCode(200, response));
        }
    }
}

